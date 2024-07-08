import 'package:the_wall/constants.dart';
import 'package:the_wall/helpers/helepers.dart';

class CommentModel {
  String comment;
  String commentedBy;
  String time;
  CommentModel(
      {required this.commentedBy, required this.comment, required this.time});

  factory CommentModel.fromjson(jsonData) {
    return CommentModel(
      comment: jsonData[kCommentContent],
      commentedBy: jsonData[kCommentedBy],
      time: formateDate(jsonData[kTimesTamps]),
    );
  }
}
