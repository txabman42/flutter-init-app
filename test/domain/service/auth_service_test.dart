import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/password.dart';
import 'package:trickster/core/model/valueobjects/phone_number.dart';
import 'package:trickster/core/model/valueobjects/string_single_line.dart';
import 'package:trickster/core/model/valueobjects/unique_id.dart';
import 'package:trickster/domain/entity/user.dart';
import 'package:trickster/domain/repository/i_auth_repository.dart';
import 'package:trickster/domain/service/auth_service.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  MockAuthRepository mockAuthRepository;
  AuthService authService;

  setUp(() async {
    mockAuthRepository = MockAuthRepository();
    authService = AuthService(mockAuthRepository);
  });

  final User tUser = User(
      id: UniqueId.fromUniqueString("123"),
      name: StringSingleLine("Random Name"),
      emailAddress: EmailAddress("random@email.com"),
      emailVerified: true,
      isAnonymous: false,
      phoneNumber: PhoneNumber("+34 123456789"),
      photoUrl: "random_url");

  group('getSignedInUser', () {
    test('should return directly the response from authRepository', () {
      when(mockAuthRepository.getSignedInUser()).thenReturn(optionOf(tUser));
      final result = authService.getSignedInUser();
      expect(result, optionOf(tUser));
      verify(mockAuthRepository.getSignedInUser());
    });
  });

  group('registerWithEmailAndPassword', () {
    final password = Password("random password");

    test(
        'should return directly the response from authRepository when correct response',
        () async {
      when(mockAuthRepository.registerWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password))
          .thenAnswer((_) async => right(tUser));
      final result = await authService.registerWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password);
      expect(result, right(tUser));
      verify(mockAuthRepository.registerWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password));
    });

    test(
        'should return directly the response from authRepository when exception',
        () async {
      when(mockAuthRepository.registerWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password))
          .thenAnswer((_) async => left(const AuthException.serverError()));
      final result = await authService.registerWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password);
      expect(result, left(const AuthException.serverError()));
      verify(mockAuthRepository.registerWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password));
    });
  });

  group('signInWithEmailAndPassword', () {
    final password = Password("random password");

    test(
        'should return directly the response from authRepository when correct response',
            () async {
          when(mockAuthRepository.signInWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password))
              .thenAnswer((_) async => right(tUser));
          final result = await authService.signInWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password);
          expect(result, right(tUser));
          verify(mockAuthRepository.signInWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password));
        });

    test(
        'should return directly the response from authRepository when exception',
            () async {
          when(mockAuthRepository.signInWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password))
              .thenAnswer((_) async => left(const AuthException.serverError()));
          final result = await authService.signInWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password);
          expect(result, left(const AuthException.serverError()));
          verify(mockAuthRepository.signInWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password));
        });
  });

  group('signInWithGoogle', () {
    test(
        'should return directly the response from authRepository when correct response',
            () async {
          when(mockAuthRepository.signInWithGoogle())
              .thenAnswer((_) async => right(tUser));
          final result = await authService.signInWithGoogle();
          expect(result, right(tUser));
          verify(mockAuthRepository.signInWithGoogle());
        });

    test(
        'should return directly the response from authRepository when exception',
            () async {
          when(mockAuthRepository.signInWithGoogle())
              .thenAnswer((_) async => left(const AuthException.serverError()));
          final result = await authService.signInWithGoogle();
          expect(result, left(const AuthException.serverError()));
          verify(mockAuthRepository.signInWithGoogle());
        });
  });

  group('signOut', () {
    test('should call directly to repository signOut', () async {
      await authService.signOut();
      verify(mockAuthRepository.signOut());
    });
  });
}
