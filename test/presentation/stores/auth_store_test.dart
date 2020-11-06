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
import 'package:trickster/presentation/service/i_auth_service.dart';
import 'package:trickster/presentation/stores/auth_store.dart';
import 'package:trickster/presentation/stores/constant/states.dart';

class MockAuthService extends Mock implements IAuthService {}

void main() {
  IAuthService authService;
  AuthStore authStore;

  setUp(() {
    authService = MockAuthService();
    authStore = AuthStore(authService);
  });

  final User tUser = User(
      id: UniqueId.fromUniqueString("123"),
      name: StringSingleLine("Random Name"),
      emailAddress: EmailAddress("random@email.com"),
      emailVerified: true,
      isAnonymous: false,
      phoneNumber: PhoneNumber("+34 688653292"),
      photoUrl: "random_url");

  group('isLogged', () {
    test('should be true when user is not null', () {
      authStore.user = tUser;
      expect(authStore.isLogged, isTrue);
    });

    test('should be false when user is null', () {
      expect(authStore.isLogged, isFalse);
    });
  });

  group('setUser', () {
    test('should set user to input value', () {
      authStore.setUser(tUser);
      expect(authStore.user, tUser);
    });
  });

  group('signOut', () {
    test('should set user to null when correctly signed out', () async {
      authStore.user = tUser;
      when(authService.signOut()).thenAnswer((_) async => right(null));
      await authStore.singOut();
      expect(authStore.state, StoreState.loaded);
      expect(authStore.user, null);
    });

    test('should set user to null when correctly signed out', () async {
      authStore.user = tUser;
      when(authService.signOut())
          .thenAnswer((_) async => left(const AuthException.serverError()));
      await authStore.singOut();
      expect(authStore.state, StoreState.error);
      expect(authStore.errorMessage, isNotNull);
    });
  });

  group('getSignedInUser', () {
    test('should set user when loaded correctly', () {
      when(authService.getSignedInUser()).thenReturn(right(tUser));
      final result = authStore.getSignedInUser();
      expect(result, tUser);
      expect(authStore.user, tUser);
      expect(authStore.state, StoreState.loaded);
    });

    test('should set exception when loaded incorrectly', () {
      when(authService.getSignedInUser())
          .thenReturn(left(const AuthException.cancelledByUser()));
      authStore.getSignedInUser();
      expect(authStore.state, StoreState.error);
      expect(authStore.errorMessage, isNotNull);
    });
  });

  group('registerWithEmailAndPassword', () {
    final password = Password("randomPassword");

    test('should set user when loaded correctly', () async {
      when(authService.registerWithEmailAndPassword(
              emailAddress: tUser.emailAddress, password: password))
          .thenAnswer((_) async => right(tUser));
      await authStore.registerWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password);
      expect(authStore.user, tUser);
      expect(authStore.state, StoreState.loaded);
    });

    test('should set exception when loaded incorrectly', () async {
      when(authService.registerWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password))
          .thenAnswer((_) async => left(const AuthException.invalidEmailAndPasswordCombination()));
      await authStore.registerWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password);
      expect(authStore.state, StoreState.error);
      expect(authStore.errorMessage, isNotNull);
    });
  });

  group('signInWithGoogle', () {
    test('should set user when loaded correctly', () async {
      when(authService.signInWithGoogle())
          .thenAnswer((_) async => right(tUser));
      await authStore.signInWithGoogle();
      expect(authStore.user, tUser);
      expect(authStore.state, StoreState.loaded);
    });

    test('should set exception when loaded incorrectly', () async {
      when(authService.signInWithGoogle())
          .thenAnswer((_) async => left(const AuthException.cancelledByUser()));
      await authStore.signInWithGoogle();
      expect(authStore.state, StoreState.error);
      expect(authStore.errorMessage, isNotNull);
    });
  });

  group('signInWithEmailAndPassword', () {
    final password = Password("randomPassword");

    test('should set user when loaded correctly', () async {
      when(authService.signInWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password))
          .thenAnswer((_) async => right(tUser));
      await authStore.signInWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password);
      expect(authStore.user, tUser);
      expect(authStore.state, StoreState.loaded);
    });

    test('should set exception when loaded incorrectly', () async {
      when(authService.signInWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password))
          .thenAnswer((_) async => left(const AuthException.invalidEmailAndPasswordCombination()));
      await authStore.signInWithEmailAndPassword(
          emailAddress: tUser.emailAddress, password: password);
      expect(authStore.state, StoreState.error);
      expect(authStore.errorMessage, isNotNull);
    });
  });
}
