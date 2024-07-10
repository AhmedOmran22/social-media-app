
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/constants.dart';
import 'package:the_wall/models/post_model.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/wall_post.dart';

class PostBuilder extends StatelessWidget {
  const PostBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: 
        FirebaseFirestore.instance
            .collection(kUserPosts)
            .orderBy(kTimesTamps, descending: true)
            .snapshots()
      ,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PostModel> posts = [];
          List<String> postId = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            posts.add(
              PostModel.fromjson(
                snapshot.data!.docs[i],
              ),
            );
            postId.add(snapshot.data!.docs[i].id);
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return WallPost(
                postModel: posts[index],
                postId: postId[index],
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error ${snapshot.error}'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
      },
    );
  }
}
