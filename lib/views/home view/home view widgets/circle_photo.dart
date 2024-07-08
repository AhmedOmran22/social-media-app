import 'package:flutter/material.dart';
class CireclePhoto extends StatelessWidget {
  const CireclePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[400],
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person,
        size: 25,
      ),
    );
  }
}
