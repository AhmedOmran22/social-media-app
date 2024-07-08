import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/constants.dart';
import 'package:the_wall/models/user_model.dart';
import 'package:the_wall/views/profile%20view/profile%20view%20widgets/user_info_builder.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection(kUsers)
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserModel user = UserModel.fromjson(snapshot.data!.data());
            return UserInfoBuilder(
              currentUser: currentUser,
              user: user,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }


}



// ListView(
//         children: [
//           SizedBox(height: MediaQuery.of(context).size.height * .15),
//           CircleAvatar(
//             backgroundColor: Colors.grey,
//             radius: MediaQuery.of(context).size.height * .1,
//             child: Icon(
//               Icons.person,
//               size: 100,
//               color: Colors.grey[900],
//             ),
//           ),
//           SizedBox(height: MediaQuery.of(context).size.height * .05),
//           Text(
//             currentUser.email!,
//             textAlign: TextAlign.center,
//             style: const TextStyle(fontSize: 22),
//           ),
//           const SizedBox(height: 20),
//           TextBox(
//             sectionName: 'sectionName',
//             text: currentUser.displayName!,
//             onPressed: () {},
//           ),
//           TextBox(
//             sectionName: 'My Bio',
//             text:
//                 'welcome all to my domain I am Ahmed mamdouh 3omran and I ama senior flutter develpoer and team leader and I am on my way to be google expert in flutter and dart thanks all ',
//             onPressed: () {},
//           ),
//         ],
//       )









 // const Text(
          //   'My Posts',
          //   textAlign: TextAlign.center,
          //   style: TextStyle(fontSize: 18),
          // ),