import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';
import 'package:trickster/data/model/user_dto.dart';

@lazySingleton
class FirebaseUserDtoMapper {
  UserDto toDto(firebase_auth.User _) {
    return _ == null
        ? null
        : UserDto(
            id: _.uid,
            name: _.displayName ?? _.email.split('@').first,
            emailAddress: _.email,
            emailVerified: _.emailVerified,
            isAnonymous: _.isAnonymous,
            phoneNumber: _.phoneNumber,
            photoUrl: _.photoURL);
  }
}
