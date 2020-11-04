import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/password.dart';
import 'package:trickster/domain/entity/user.dart';

abstract class IAuthRepository {
  Option<User> getSignedInUser();

  Future<Either<AuthException, User>> registerWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  Future<Either<AuthException, User>> signInWithEmailAndPassword(
      {@required EmailAddress emailAddress, @required Password password});

  Future<Either<AuthException, User>> signInWithGoogle();

  Future<void> signOut();
}