import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trickster/core/error/auth_exception.dart';
import 'package:trickster/core/model/valueobjects/email_address.dart';
import 'package:trickster/core/model/valueobjects/password.dart';
import 'package:trickster/domain/entity/user.dart';
import 'package:trickster/presentation/service/i_auth_service.dart';
import 'package:trickster/presentation/stores/constant/errors.dart';

import 'constant/states.dart';

part 'auth_store.g.dart';

@injectable
class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore(IAuthService authService) : super(authService);
}

abstract class _AuthStore with Store {
  final IAuthService _authService;

  List<ReactionDisposer> _disposers;

  _AuthStore(this._authService) {
    _disposers = [
      reaction((_) => errorMessage, resetError, delay: 1000),
    ];
  }

  @observable
  StoreState state = StoreState.initial;

  @observable
  String errorMessage = "";

  @observable
  User user;

  @computed
  bool get isLogged => user != null;

  @action
  void resetError(String value) {
    errorMessage = "";
    state = StoreState.initial;
  }

  @action
  void setUser(User value) => setUser(value);

  @action
  Future<void> singOut() async {
    state = StoreState.loading;
    _authService.signOut().then((_) => _.fold(
        (exception) => _mapExceptionToErrorMessage(exception),
        (_) => {
              state = StoreState.loaded,
              setUser(null),
            }));
  }

  @action
  User getSignedInUser() {
    state = StoreState.loading;
    return _authService.getSignedInUser().fold((exception) {
      _mapExceptionToErrorMessage(exception);
      return null;
    }, (value) => value);
  }

  @action
  Future<void> registerWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    state = StoreState.loading;
    _authService
        .registerWithEmailAndPassword(
            emailAddress: emailAddress, password: password)
        .then((value) => _setUser(value));
  }

  @action
  Future<void> signInWithGoogle() async {
    state = StoreState.loading;
    _authService.signInWithGoogle().then((value) => _setUser(value));
  }

  @action
  Future<void> signInWithEmailAndPassword(
      {EmailAddress emailAddress, Password password}) async {
    state = StoreState.loading;
    _authService
        .signInWithEmailAndPassword(
            emailAddress: emailAddress, password: password)
        .then((value) => _setUser(value));
  }

  void _setUser(Either<AuthException, User> value) {
    value.fold((exception) => _mapExceptionToErrorMessage(exception), (value) {
      state = StoreState.loaded;
      setUser(value);
    });
  }

  void _mapExceptionToErrorMessage(AuthException exception) {
    switch (exception.runtimeType) {
      case CancelledByUser:
        errorMessage = Errors.AUTH_CANCELLED_BY_USER_MESSAGE;
        break;
      case ServerError:
        errorMessage = Errors.AUTH_SERVER_ERROR_MESSAGE;
        break;
      case EmailAlreadyInUse:
        errorMessage = Errors.AUTH_EMAIL_ALREADY_IN_USE_MESSAGE;
        break;
      case InvalidEmailAndPasswordCombination:
        errorMessage = Errors.AUTH_INVALID_EMAIL_PASSWORD_MESSAGE;
        break;
      default:
        errorMessage = Errors.UNEXPECTED_ERROR_MESSAGE;
        break;
    }
    state = StoreState.error;
  }

  // dispose:-----------------------------------------------------
  @action
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
