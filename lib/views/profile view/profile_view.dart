import 'package:flutter/material.dart';
import 'package:the_wall/views/profile%20view/profile%20view%20widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[900],
        title: const Text('Profile page'),
        centerTitle: true,
      ),
      body: const ProfileViewBody(),
    );
  }
}
