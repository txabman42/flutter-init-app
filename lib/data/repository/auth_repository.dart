import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/password.dart';
import 'package:trickster/data/datasource/firebase_auth_datasource.dart';
import 'package:trickster/data/util/user_dto_mapper.dart';
import 'package:trickster/domain/entity/user.dart';
import 'package:trickster/domain/repository/i_auth_repository.dart';

@prod
@lazySingleton
@RegisterAs(IAuthRepository)
class AuthRepository implements IAuthRepository {
  final IFirebaseAuthDatasource _firebaseAuthDatasource;

  AuthRepository(
    this._firebaseAuthDatasource,
  );

  @override
  Option<User> getSignedInUser() {
    return optionOf(
        UserMapper().fromDto(_firebaseAuthDatasource.getSignedInUser()));
  }

  @override
  Future<Either<AuthException, User>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress,
      @required Password password}) async {
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');
    return _firebaseAuthDatasource
        .registerWithEmailAndPassword(
            emailAddress: emailAddressStr, password: passwordStr)
        .then((_) =>
            _.fold((l) => left(l), (r) => right(UserMapper().fromDto(r))));
  }

  @override
  Future<Either<AuthException, User>> signInWithEmailAndPassword(
      {@required EmailAddress emailAddress,
      @required Password password}) async {
    final emailAddressStr = emailAddress.value.getOrElse(() => 'INVALID EMAIL');
    final passwordStr = password.value.getOrElse(() => 'INVALID PASSWORD');
    return _firebaseAuthDatasource
        .signInWithEmailAndPassword(
            emailAddress: emailAddressStr, password: passwordStr)
        .then((_) =>
            _.fold((l) => left(l), (r) => right(UserMapper().fromDto(r))));
  }

  @override
  Future<Either<AuthException, User>> signInWithGoogle() async {
    return _firebaseAuthDatasource.signInWithGoogle().then(
        (_) => _.fold((l) => left(l), (r) => right(UserMapper().fromDto(r))));
  }

  @override
  Future<void> signOut() {
    return _firebaseAuthDatasource.signOut();
  }
}
