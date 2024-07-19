import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/constants.dart';
import 'package:the_wall/models/user_model.dart';
import 'package:the_wall/views/profile%20view/profile%20view%20widgets/text_box.dart';

class UserInfoBuilder extends StatefulWidget {
  const UserInfoBuilder({
    super.key,
    required this.currentUser,
    required this.user,
  });

  final User currentUser;
  final UserModel user;

  @override
  State<UserInfoBuilder> createState() => _UserInfoBuilderState();
}

class _UserInfoBuilderState extends State<UserInfoBuilder> {
  final nameEditingController = TextEditingController();
  final bioEditingController = TextEditingController();
  final usersCollection = FirebaseFirestore.instance.collection(kUsers);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .15),
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: MediaQuery.of(context).size.height * .1,
          child: Icon(
            Icons.person,
            size: 100,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .05),
        Text(
          widget.currentUser.email!,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 20),
        TextBox(
          sectionName: 'Name',
          text: widget.user.displayName,
          onPressed: () {
            editNameMethod(context);
          },
        ),
        TextBox(
          sectionName: 'My Bio',
          text: widget.user.bio,
          onPressed: () {
            editBioMethod(context);
          },
        ),
      ],
    );
  }

  Future<dynamic> editBioMethod(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Edit bio ',
                  style: TextStyle(),
                ),
                content: TextField(
                  controller: bioEditingController,
                  autofocus: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      nameEditingController.text = value;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Edit User name',
                    hintStyle: TextStyle(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      await usersCollection
                          .doc(widget.currentUser.email)
                          .update(
                        {
                          kBio: bioEditingController.text,
                        },
                      );
                      bioEditingController.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Save',
                    ),
                  ),
                ],
              );
            },
          );
  }

  Future<dynamic> editNameMethod(BuildContext context) {
    return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text(
                  'Edit Name ',
                  style: TextStyle(
                  ),
                ),
                content: TextField(
                  controller: nameEditingController,
                  autofocus: true,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      nameEditingController.text = value;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Edit User name',
                    hintStyle: TextStyle(),
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      await usersCollection
                          .doc(widget.currentUser.email)
                          .update(
                        {
                          kUserName: nameEditingController.text,
                        },
                      );
                      nameEditingController.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Save',
                    ),
                  ),
                ],
              );
            },
          );
  }
}
