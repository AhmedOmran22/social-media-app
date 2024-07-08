import 'package:flutter/material.dart';
import 'package:the_wall/views/home%20view/home%20view%20widgets/custom_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
    required this.onHomeTap,
    required this.onProfileTap,
    required this.onLogOutTap,
  });

  final VoidCallback onHomeTap;
  final VoidCallback onProfileTap;
  final VoidCallback onLogOutTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          const Icon(
            Icons.person,
            color: Colors.white,
            size: 100,
          ),
          const SizedBox(height: 20),
          CustomListTile(
            icon: Icons.home,
            text: 'Home',
            onTap: onHomeTap,
          ),
          CustomListTile(
            icon: Icons.person_2,
            text: 'Profile',
            onTap: onProfileTap,
          ),
          CustomListTile(
            icon: Icons.logout,
            text: 'Log out',
            onTap: onLogOutTap,
          ),
        ],
      ),
    );
  }
}
