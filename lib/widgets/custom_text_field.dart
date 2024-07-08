import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.onPressed,
  });
  final TextEditingController controller;
  final String hintText;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      cursorColor: Colors.blue,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey[200],
        filled: true,
        enabledBorder: buildBorder(),
        border: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(4),
    );
  }
}
