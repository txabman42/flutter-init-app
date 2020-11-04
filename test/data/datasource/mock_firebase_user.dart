import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockBaseFirebaseUser extends Mock implements User {
  @override
  String get uid => '123';

  @override
  String get email => 'random@email.com';

  @override
  bool get emailVerified => true;

  @override
  bool get isAnonymous => false;

  @override
  String get phoneNumber => '+34 123456789';

  @override
  String get photoURL => 'random_url';
}

class MockFirebaseUserWithDisplayName extends MockBaseFirebaseUser {
  @override
  String get displayName => 'Random Name';
}

class MockFirebaseUserWithoutDisplayName extends MockBaseFirebaseUser {
  @override
  String get displayName => null;
}

class MockFirebaseUserCredentials extends Mock implements UserCredential {
  @override
  User get user => MockFirebaseUserWithDisplayName();
}