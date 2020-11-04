import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

// ignore: avoid_implementing_value_types
class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {
  @override
  Future<GoogleSignInAuthentication> get authentication =>
      Future.value(MockGoogleSignInAuthentication());
}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {
  @override
  final accessToken = "Access Token";
  @override
  final idToken = "ID Token";
}
