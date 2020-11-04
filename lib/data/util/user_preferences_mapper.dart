import 'package:injectable/injectable.dart';
import 'package:trickster/data/model/user_preferences_dto.dart';
import 'package:trickster/domain/entity/user_preferences.dart';

@lazySingleton
class UserPreferencesMapper {
  UserPreferences fromDto(UserPreferencesDto _) {
    return _ == null
        ? null
        : UserPreferences(isLogged: _.isLogged, isDark: _.isDark);
  }
}
