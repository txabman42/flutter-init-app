import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/data/datasource/firebase_auth_datasource.dart';
import 'package:trickster/data/model/user_dto.dart';

import 'mock_firebase_user.dart';
import 'mock_google_sign_in_account.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

void main() {
  IFirebaseAuthDatasource firebaseAuthDatasource;
  MockGoogleSignIn mockGoogleSignIn;
  MockFirebaseAuth mockFirebaseAuth;

  setUp(() async {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    firebaseAuthDatasource =
        FirebaseAuthDatasource(mockFirebaseAuth, mockGoogleSignIn);
  });

  final tUserDto = UserDto(
      id: "123",
      name: "Random Name",
      emailAddress: "random@email.com",
      emailVerified: true,
      isAnonymous: false,
      phoneNumber: "+34 123456789",
      photoUrl: "random_url");

  group('getSignedInUSer', () {
    test('should return user when user is signedIn', () {
      when(mockFirebaseAuth.currentUser)
          .thenReturn(MockFirebaseUserWithDisplayName());
      final result = firebaseAuthDatasource.getSignedInUser();
      expect(result, right(tUserDto));
    });

    test('should return notFoundException when user is not signedIn', () {
      when(mockFirebaseAuth.currentUser).thenReturn(null);
      final result = firebaseAuthDatasource.getSignedInUser();
      expect(result, left(const AuthException.userNotFound()));
    });
  });

  group('registerWithEmailAndPassword', () {
    const emailAddressStr = "random@email.com";
    const passwordStr = "randomPassword";

    test('should return unit when user is registered correctly', () async {
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenAnswer((_) async => MockFirebaseUserCredentials());
      final result = await firebaseAuthDatasource.registerWithEmailAndPassword(
          emailAddress: emailAddressStr, password: passwordStr);
      expect(result, right(tUserDto));
      verify(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr));
    });

    test(
        'should return emailAlreadyInUse AuthException when email is already in user',
        () async {
      const errorCode = 'ERROR_EMAIL_ALREADY_IN_USE';
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenThrow(PlatformException(code: errorCode));
      final result = await firebaseAuthDatasource.registerWithEmailAndPassword(
          emailAddress: emailAddressStr, password: passwordStr);
      expect(result.isLeft(), isTrue);
      expect(result, left(const AuthException.emailAlreadyInUse()));
      verify(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr));
    });

    test(
        'should return serverError AuthException when exception is not email already in use',
        () async {
      const errorCode = 'RANDOM_ERROR';
      when(mockFirebaseAuth.createUserWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenThrow(PlatformException(code: errorCode));
      final result = await firebaseAuthDatasource.registerWithEmailAndPassword(
          emailAddress: emailAddressStr, password: passwordStr);
      expect(result.isLeft(), isTrue);
      expect(result, left(const AuthException.serverError()));
      verify(mockFirebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr));
    });
  });

  group('signInWithEmailAndPassword', () {
    const emailAddressStr = "random@email.com";
    const passwordStr = "randomPassword";

    test('should return unit when user is sign in correctly', () async {
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenAnswer((_) async => MockFirebaseUserCredentials());
      final result = await firebaseAuthDatasource.signInWithEmailAndPassword(
          emailAddress: emailAddressStr, password: passwordStr);
      expect(result, right(tUserDto));
      verify(mockFirebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr));
    });

    test(
        'should return invalidEmailAndPasswordCombination when user is not found',
        () async {
      final List<String> errorCodes = List(2);
      errorCodes[0] = "ERROR_WRONG_PASSWORD";
      errorCodes[1] = "ERROR_USER_NOT_FOUND";
      for (final String errorCode in errorCodes) {
        when(mockFirebaseAuth.signInWithEmailAndPassword(
                email: emailAddressStr, password: passwordStr))
            .thenThrow(PlatformException(code: errorCode));
        final result = await firebaseAuthDatasource.signInWithEmailAndPassword(
            emailAddress: emailAddressStr, password: passwordStr);
        expect(result.isLeft(), isTrue);
        expect(result,
            left(const AuthException.invalidEmailAndPasswordCombination()));
        verify(mockFirebaseAuth.signInWithEmailAndPassword(
            email: emailAddressStr, password: passwordStr));
      }
    });

    test(
        'should return serverError when exception is not user not found or wrong password',
        () async {
      const errorCode = 'RANDOM_ERROR';
      when(mockFirebaseAuth.signInWithEmailAndPassword(
              email: emailAddressStr, password: passwordStr))
          .thenThrow(PlatformException(code: errorCode));
      final result = await firebaseAuthDatasource.signInWithEmailAndPassword(
          emailAddress: emailAddressStr, password: passwordStr);
      expect(result.isLeft(), isTrue);
      expect(result, left(const AuthException.serverError()));
      verify(mockFirebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr, password: passwordStr));
    });
  });

  group('signInWithGoogle', () {
    test('should return unit when user is sign in correctly', () async {
      when(mockGoogleSignIn.signIn())
          .thenAnswer((_) async => MockGoogleSignInAccount());
      when(mockFirebaseAuth.signInWithCredential(any))
          .thenAnswer((_) async => MockFirebaseUserCredentials());
      final result = await firebaseAuthDatasource.signInWithGoogle();
      expect(result, right(tUserDto));
      verify(mockGoogleSignIn.signIn());
      verify(mockFirebaseAuth.signInWithCredential(any));
    });

    test('should return cancelledByUser when googleSignIn is null', () async {
      when(mockGoogleSignIn.signIn()).thenAnswer((_) => null);
      final result = await firebaseAuthDatasource.signInWithGoogle();
      expect(result.isLeft(), isTrue);
      expect(result, left(const AuthException.cancelledByUser()));
      verify(mockGoogleSignIn.signIn());
      verifyNever(mockFirebaseAuth.signInWithCredential(any));
    });

    test('should return serverError when firebaseAuth throws an exception',
        () async {
      const errorCode = 'RANDOM_ERROR';
      when(mockGoogleSignIn.signIn())
          .thenAnswer((_) async => MockGoogleSignInAccount());
      when(mockFirebaseAuth.signInWithCredential(any))
          .thenThrow(PlatformException(code: errorCode));
      final result = await firebaseAuthDatasource.signInWithGoogle();
      expect(result.isLeft(), isTrue);
      expect(result, left(const AuthException.serverError()));
      verify(mockGoogleSignIn.signIn());
      verify(mockFirebaseAuth.signInWithCredential(any));
    });
  });

  group('signOut', () {
    test('should wait for google signOut and firebase signOut', () async {
      when(mockGoogleSignIn.signOut())
          .thenAnswer((_) async => MockGoogleSignInAccount());
      when(mockFirebaseAuth.signOut()).thenAnswer((_) async => null);
      await firebaseAuthDatasource.signOut();
      verify(mockGoogleSignIn.signOut());
      verify(mockFirebaseAuth.signOut());
    });
  });
}
