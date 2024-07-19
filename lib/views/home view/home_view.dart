import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/my_drawer.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/home_view_body.dart';

import '../profile view/profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(
        onHomeTap: () {
          Navigator.of(context).pop();
        },
        onProfileTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfileView(),
            ),
          );
        },
        onLogOutTap: signOut,
      ),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'TrendFlow',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[400],
      body: const HomeViewBody(),
    );
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }
}
