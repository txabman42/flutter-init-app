import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trickster/data/util/firebase_user_dto_mapper.dart';

import '../datasource/mock_firebase_user.dart';



void main() {
  test(
      'should return firebase user displayName as user name when displayName not null',
      () {
    final User tFirebaseUser = MockFirebaseUserWithDisplayName();
    final result = FirebaseUserDtoMapper().toDto(tFirebaseUser);
    expect(result.name, tFirebaseUser.displayName);
  });

  test(
      'should return firebase user email as user name when displayName not null',
      () {
    final User tFirebaseUser = MockFirebaseUserWithDisplayName();
    final result = FirebaseUserDtoMapper().toDto(tFirebaseUser);
    expect(result.name, tFirebaseUser.displayName.split('@').first);
  });
}
