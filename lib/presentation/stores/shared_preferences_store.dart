import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trickster/presentation/service/i_shared_preferences_service.dart';

part 'shared_preferences_store.g.dart';

@injectable
class SharedPreferencesStore extends _SharedPreferencesStore
    with _$SharedPreferencesStore {
  SharedPreferencesStore(ISharedPreferencesService sharedPreferencesService)
      : super(sharedPreferencesService);
}

abstract class _SharedPreferencesStore with Store {
  final ISharedPreferencesService _sharedPreferencesService;

  _SharedPreferencesStore(this._sharedPreferencesService);


}
