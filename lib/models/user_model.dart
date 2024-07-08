import 'package:the_wall/constants.dart';

class UserModel {
  String bio;
  String displayName;

  UserModel({
    required this.bio,
    required this.displayName,
  });

  factory UserModel.fromjson(jsonData) {
    return UserModel(
      bio: jsonData[kBio],
      displayName: jsonData[kUserName],
    );
  }
}
