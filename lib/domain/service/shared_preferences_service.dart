import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:trickster/core/error/shared_preferences_exception.dart';
import 'package:trickster/domain/entity/user_preferences.dart';
import 'package:trickster/domain/repository/i_shared_preferences_repository.dart';
import 'package:trickster/presentation/service/i_shared_preferences_service.dart';

@lazySingleton
@RegisterAs(ISharedPreferencesService)
class SharedPreferencesService implements ISharedPreferencesService {
  final ISharedPreferencesRepository _sharedPreferencesRepository;

  SharedPreferencesService(this._sharedPreferencesRepository);

  @override
  Either<SharedPreferencesException, UserPreferences> getUserPreferences() {
    return _sharedPreferencesRepository.getUserPreferences();
  }

  @override
  Future<bool> setUserPreferences(UserPreferences userPreferences) {
    return _sharedPreferencesRepository.setUserPreferences(userPreferences);
  }
}
