import 'package:flutter/material.dart';

class LikedButton extends StatelessWidget {
  const LikedButton({
    super.key,
    this.onTap,
    required this.isLiked,
  });
  final bool isLiked;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        isLiked ? Icons.favorite : Icons.favorite_outline,
        color: isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
