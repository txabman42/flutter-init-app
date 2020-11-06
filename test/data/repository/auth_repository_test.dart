import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/password.dart';
import 'package:trickster/core/model/valueobjects/phone_number.dart';
import 'package:trickster/core/model/valueobjects/string_single_line.dart';
import 'package:trickster/core/model/valueobjects/unique_id.dart';
import 'package:trickster/data/datasource/firebase_auth_datasource.dart';
import 'package:trickster/data/model/user_dto.dart';
import 'package:trickster/data/repository/auth_repository.dart';
import 'package:trickster/domain/entity/user.dart';

class MockFirebaseAuthDatasource extends Mock
    implements IFirebaseAuthDatasource {}

void main() {
  MockFirebaseAuthDatasource mockFirebaseAuthDatasource;
  AuthRepository authRepository;

  User tUser;
  UserDto tUserDto;

  setUp(() async {
    mockFirebaseAuthDatasource = MockFirebaseAuthDatasource();
    authRepository = AuthRepository(mockFirebaseAuthDatasource);

    tUser = User(
        id: UniqueId.fromUniqueString("123"),
        name: StringSingleLine("Random Name"),
        emailAddress: EmailAddress("random@email.com"),
        emailVerified: true,
        isAnonymous: false,
        phoneNumber: PhoneNumber("+34 123456789"),
        photoUrl: "random_url");

    tUserDto = UserDto(
        id: "123",
        name: "Random Name",
        emailAddress: "random@email.com",
        emailVerified: true,
        isAnonymous: false,
        phoneNumber: "+34 123456789",
        photoUrl: "random_url");
  });

  group('getSignedInUser', () {
    test('should return user when user not null', () async {
      when(mockFirebaseAuthDatasource.getSignedInUser())
          .thenReturn(right(tUserDto));
      final result = authRepository.getSignedInUser();
      expect(result, right(tUser));
      verify(mockFirebaseAuthDatasource.getSignedInUser());
    });

    test('should return userNotFound exception when user not null', () async {
      when(mockFirebaseAuthDatasource.getSignedInUser())
          .thenReturn(left(const AuthException.userNotFound()));
      final result = authRepository.getSignedInUser();
      expect(result, left(const AuthException.userNotFound()));
      verify(mockFirebaseAuthDatasource.getSignedInUser());
    });
  });

  group('registerWithEmailAndPassword', () {
    test('should return tUser when user is registered correctly', () async {
      const _emailAddress = "random@email.com";
      const _password = "password";
      when(mockFirebaseAuthDatasource.registerWithEmailAndPassword(
              emailAddress: _emailAddress, password: _password))
          .thenAnswer((_) async => right(tUserDto));
      final result = await authRepository.registerWithEmailAndPassword(
          emailAddress: EmailAddress(_emailAddress),
          password: Password(_password));
      expect(result, right(tUser));
      verify(mockFirebaseAuthDatasource.registerWithEmailAndPassword(
          emailAddress: _emailAddress, password: _password));
    });

    test('should return authException when user is not registered correctly',
        () async {
      const String _emailAddress = '';
      const String _password = '';
      when(mockFirebaseAuthDatasource.registerWithEmailAndPassword(
              emailAddress: 'INVALID EMAIL', password: 'INVALID PASSWORD'))
          .thenAnswer((_) async =>
              left(const AuthException.invalidEmailAndPasswordCombination()));
      final result = await authRepository.registerWithEmailAndPassword(
          emailAddress: EmailAddress(_emailAddress),
          password: Password(_password));
      expect(result,
          left(const AuthException.invalidEmailAndPasswordCombination()));
      verify(mockFirebaseAuthDatasource.registerWithEmailAndPassword(
          emailAddress: 'INVALID EMAIL', password: 'INVALID PASSWORD'));
    });
  });

  group('signInWithEmailAndPassword', () {
    test('should return tUser when user is signed in correctly', () async {
      const _emailAddress = "random@email.com";
      const _password = "password";
      when(mockFirebaseAuthDatasource.signInWithEmailAndPassword(
              emailAddress: _emailAddress, password: _password))
          .thenAnswer((_) async => right(tUserDto));
      final result = await authRepository.signInWithEmailAndPassword(
          emailAddress: EmailAddress(_emailAddress),
          password: Password(_password));
      expect(result, right(tUser));
      verify(mockFirebaseAuthDatasource.signInWithEmailAndPassword(
          emailAddress: _emailAddress, password: _password));
    });

    test('should return authException when user is not signed in correctly',
        () async {
      const String _emailAddress = '';
      const String _password = '';
      when(mockFirebaseAuthDatasource.signInWithEmailAndPassword(
              emailAddress: 'INVALID EMAIL', password: 'INVALID PASSWORD'))
          .thenAnswer((_) async =>
              left(const AuthException.invalidEmailAndPasswordCombination()));
      final result = await authRepository.signInWithEmailAndPassword(
          emailAddress: EmailAddress(_emailAddress),
          password: Password(_password));
      expect(result,
          left(const AuthException.invalidEmailAndPasswordCombination()));
      verify(mockFirebaseAuthDatasource.signInWithEmailAndPassword(
          emailAddress: 'INVALID EMAIL', password: 'INVALID PASSWORD'));
    });
  });

  group('signInWithGoogle', () {
    test('should return tUser when user is signed in correctly', () async {
      when(mockFirebaseAuthDatasource.signInWithGoogle())
          .thenAnswer((_) async => right(tUserDto));
      final result = await authRepository.signInWithGoogle();
      expect(result, right(tUser));
      verify(mockFirebaseAuthDatasource.signInWithGoogle());
    });

    test('shoudl return authException when user is not signed in correctly',
        () async {
      when(mockFirebaseAuthDatasource.signInWithGoogle())
          .thenAnswer((_) async => left(const AuthException.cancelledByUser()));
      final result = await authRepository.signInWithGoogle();
      expect(result, left(const AuthException.cancelledByUser()));
      verify(mockFirebaseAuthDatasource.signInWithGoogle());
    });
  });

  group('signOut', () {
    test('should call firebase sign out', () async {
      await authRepository.signOut();
      verify(mockFirebaseAuthDatasource.signOut());
    });
  });
}
