import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/constants.dart';
import 'package:the_wall/models/comment_model.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/wall_post.dart';

import 'comment.dart';
class CommentBuilder extends StatelessWidget {
  const CommentBuilder({
    super.key,
    required this.widget,
  });

  final WallPost widget;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection(kUserPosts)
          .doc(widget.postId)
          .collection(kComments)
          .orderBy(kTimesTamps, descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        List<CommentModel> comments = [];
        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          comments.add(
            CommentModel.fromjson(snapshot.data!.docs[i]),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Comment(commentModel: comments[index]);
          },
        );
      },
    );
  }
}
