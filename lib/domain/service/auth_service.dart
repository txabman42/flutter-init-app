import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/password.dart';
import 'package:trickster/domain/entity/user.dart';
import 'package:trickster/domain/repository/i_auth_repository.dart';
import 'package:trickster/presentation/service/i_auth_service.dart';

@lazySingleton
@RegisterAs(IAuthService)
class AuthService implements IAuthService {
  final IAuthRepository _authRepository;

  AuthService(
    this._authRepository,
  );

  @override
  Either<AuthException, User> getSignedInUser() {
    return _authRepository.getSignedInUser();
  }

  @override
  Future<Either<AuthException, User>> registerWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) {
    return _authRepository.registerWithEmailAndPassword(
        emailAddress: emailAddress, password: password);
  }

  @override
  Future<Either<AuthException, User>> signInWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) {
    return _authRepository.signInWithEmailAndPassword(emailAddress: emailAddress, password: password);
  }

  @override
  Future<Either<AuthException, User>> signInWithGoogle() {
    return _authRepository.signInWithGoogle();
  }

  @override
  Future<Either<AuthException, void>> signOut() {
    return _authRepository.signOut();
  }
}
