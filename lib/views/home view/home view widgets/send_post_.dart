import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/constants.dart';
import '../../../widgets/custom_text_field.dart';

class SendPostView extends StatefulWidget {
  const SendPostView({
    super.key,
  });

  @override
  State<SendPostView> createState() => _SendPostViewState();
}

class _SendPostViewState extends State<SendPostView> {
  User currenetUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 5,
            child: Customtextfield(
              controller: textController,
              hintText: 'write somthing in the wall',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Card(
            elevation: 5,
            child: IconButton(
              onPressed: postMessage,
              icon: const Icon(
                Icons.arrow_circle_up_outlined,
                size: 32,
              ),
            ),
          ),
        )
      ],
    );
  }

  void postMessage() {
    if (textController.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('userPosts').add(
        {
          kUserEmail: currenetUser.email,
          kMessage: textController.text,
          kTimesTamps: Timestamp.now(),
          kLikes: [],
        },
      );
      textController.clear();
    }
  }
}
