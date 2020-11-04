import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/data/model/user_dto.dart';
import 'package:trickster/data/util/firebase_user_dto_mapper.dart';

abstract class IFirebaseAuthDatasource {
  UserDto getSignedInUser();

  Future<Either<AuthException, UserDto>> registerWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  });

  Future<Either<AuthException, UserDto>> signInWithEmailAndPassword({
    @required String emailAddress,
    @required String password,
  });

  Future<Either<AuthException, UserDto>> signInWithGoogle();

  Future<void> signOut();
}

@prod
@lazySingleton
@RegisterAs(IFirebaseAuthDatasource)
class FirebaseAuthDatasource implements IFirebaseAuthDatasource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthDatasource(
    this._firebaseAuth,
    this._googleSignIn,
  );

  @override
  UserDto getSignedInUser() =>
      FirebaseUserDtoMapper().toDto(_firebaseAuth.currentUser);

  @override
  Future<Either<AuthException, UserDto>> registerWithEmailAndPassword(
      {@required String emailAddress, @required String password}) async {
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          )
          .then((_) => right(FirebaseUserDtoMapper().toDto(_.user)));
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        return left(const AuthException.emailAlreadyInUse());
      }
      return left(const AuthException.serverError());
    }
  }

  @override
  Future<Either<AuthException, UserDto>> signInWithEmailAndPassword(
      {@required String emailAddress, @required String password}) async {
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(
            email: emailAddress,
            password: password,
          )
          .then((_) => right(FirebaseUserDtoMapper().toDto(_.user)));
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthException.invalidEmailAndPasswordCombination());
      }
      return left(const AuthException.serverError());
    }
  }

  @override
  Future<Either<AuthException, UserDto>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(const AuthException.cancelledByUser());
      }

      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );
      return _firebaseAuth
          .signInWithCredential(authCredential)
          .then((_) => right(FirebaseUserDtoMapper().toDto(_.user)));
    } on PlatformException catch (_) {
      return left(const AuthException.serverError());
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      _googleSignIn.signOut(),
      _firebaseAuth.signOut(),
    ]);
  }
}
