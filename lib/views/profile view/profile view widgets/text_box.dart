import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.sectionName,
    required this.text,
    required this.onPressed,
  });
  final String sectionName;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 24, right: 12),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                sectionName,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.edit,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
