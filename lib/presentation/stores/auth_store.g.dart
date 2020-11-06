// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  Computed<bool> _$isLoggedComputed;

  @override
  bool get isLogged => (_$isLoggedComputed ??=
          Computed<bool>(() => super.isLogged, name: '_AuthStore.isLogged'))
      .value;

  final _$stateAtom = Atom(name: '_AuthStore.state');

  @override
  StoreState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(StoreState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_AuthStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthStore.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$singOutAsyncAction = AsyncAction('_AuthStore.singOut');

  @override
  Future<void> singOut() {
    return _$singOutAsyncAction.run(() => super.singOut());
  }

  final _$registerWithEmailAndPasswordAsyncAction =
      AsyncAction('_AuthStore.registerWithEmailAndPassword');

  @override
  Future<void> registerWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) {
    return _$registerWithEmailAndPasswordAsyncAction.run(() => super
        .registerWithEmailAndPassword(
            emailAddress: emailAddress, password: password));
  }

  final _$signInWithGoogleAsyncAction =
      AsyncAction('_AuthStore.signInWithGoogle');

  @override
  Future<void> signInWithGoogle() {
    return _$signInWithGoogleAsyncAction.run(() => super.signInWithGoogle());
  }

  final _$signInWithEmailAndPasswordAsyncAction =
      AsyncAction('_AuthStore.signInWithEmailAndPassword');

  @override
  Future<void> signInWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) {
    return _$signInWithEmailAndPasswordAsyncAction.run(() => super
        .signInWithEmailAndPassword(
            emailAddress: emailAddress, password: password));
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void resetError(String value) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.resetError');
    try {
      return super.resetError(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUser(User value) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  User getSignedInUser() {
    final _$actionInfo = _$_AuthStoreActionController.startAction(
        name: '_AuthStore.getSignedInUser');
    try {
      return super.getSignedInUser();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dispose() {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.dispose');
    try {
      return super.dispose();
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
errorMessage: ${errorMessage},
user: ${user},
isLogged: ${isLogged}
    ''';
  }
}
