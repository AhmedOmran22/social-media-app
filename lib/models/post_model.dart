import 'package:the_wall/constants.dart';
import 'package:the_wall/helpers/helepers.dart';

class PostModel {
  String message;
  String userEmail;
  List<dynamic> likes;
  String time;

  PostModel({
    required this.likes,
    required this.message,
    required this.userEmail,
    required this.time,

    //   required this.userName,
  });

  factory PostModel.fromjson(dynamic jsonData) {
    return PostModel(
      message: jsonData[kMessage],
      userEmail: jsonData[kUserEmail],
      likes: jsonData[kLikes],
      time: formateDate(jsonData[kTimesTamps]),
      // userName: jsonData[kUserName],
    );
  }
}
