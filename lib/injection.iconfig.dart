// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:trickster/data/util/firebase_user_dto_mapper.dart';
import 'package:trickster/data/datasource/firebase_auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trickster/data/datasource/shared_preferences_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trickster/data/util/user_dto_mapper.dart';
import 'package:trickster/data/util/user_preferences_mapper.dart';
import 'package:trickster/data/repository/auth_repository.dart';
import 'package:trickster/domain/repository/i_auth_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<FirebaseUserDtoMapper>(() => FirebaseUserDtoMapper());
  g.registerLazySingleton<UserMapper>(() => UserMapper());
  g.registerLazySingleton<UserPreferencesMapper>(() => UserPreferencesMapper());

  //Register prod Dependencies --------
  if (environment == 'prod') {
    g.registerLazySingleton<IFirebaseAuthDatasource>(
        () => FirebaseAuthDatasource(g<FirebaseAuth>(), g<GoogleSignIn>()));
    g.registerLazySingleton<ISharedPreferencesDatasource>(
        () => SharedPreferencesDatasource(g<SharedPreferences>()));
    g.registerLazySingleton<IAuthRepository>(
        () => AuthRepository(g<IFirebaseAuthDatasource>()));
  }
}
