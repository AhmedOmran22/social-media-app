import 'package:flutter/material.dart';
import 'package:the_wall/models/comment_model.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
    required this.commentModel,
  });
  final CommentModel commentModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            commentModel.commentedBy,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Row(
            children: [
              Text(
                commentModel.comment,
              ),
              const SizedBox(width: 5),
              const Spacer(),
              Text(
                commentModel.time,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
