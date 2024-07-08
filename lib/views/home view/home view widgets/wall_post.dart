import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/constants.dart';
import 'package:the_wall/models/post_model.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/circle_photo.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/comment.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/comment_builder.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/comment_button.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/like_button.dart';

class WallPost extends StatefulWidget {
  const WallPost({
    super.key,
    required this.postModel,
    required this.postId,
    this.comment,
  });
  final PostModel postModel;
  final String postId;
  final Comment? comment;

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final commentController = TextEditingController();
  bool isLiked = false;
  @override
  void initState() {
    isLiked = widget.postModel.likes.contains(currentUser.email);
    super.initState();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    DocumentReference postRef =
        FirebaseFirestore.instance.collection(kUserPosts).doc(widget.postId);

    if (isLiked) {
      postRef.update(
        {
          kLikes: FieldValue.arrayUnion(
            [currentUser.email],
          ),
        },
      );
    } else {
      postRef.update(
        {
          kLikes: FieldValue.arrayRemove(
            [currentUser.email],
          ),
        },
      );
    }
  }

  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add Comment'),
            content: TextField(
              controller: commentController,
              decoration: const InputDecoration(
                hintText: 'Write a comment',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  addComment(commentController.text);
                  commentController.clear();
                  Navigator.of(context).pop();
                },
                child: const Text('Add'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  commentController.clear();
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });
  }

  void addComment(String commentText) async {
    await FirebaseFirestore.instance
        .collection(kUserPosts)
        .doc(widget.postId)
        .collection(kComments)
        .add({
      kCommentContent: commentText,
      kCommentedBy: currentUser.email,
      kTimesTamps: Timestamp.now(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CireclePhoto(),
                const SizedBox(width: 10),
                Text(
                  widget.postModel.userEmail,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
                const Spacer(),
                Text(
                  widget.postModel.time,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                widget.postModel.message,
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      LikedButton(
                        isLiked: isLiked,
                        onTap: toggleLike,
                      ),
                      Text(
                        widget.postModel.likes.length.toString(),
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .1),
                  Column(
                    children: [
                         CommentButton(
                          onTap: () {
                            showCommentDialog();
                          },
                        
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // comments after post!
            CommentBuilder(widget: widget)
          ],
        ),
      ),
    );
  }
}
