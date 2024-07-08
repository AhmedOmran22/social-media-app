import 'package:flutter/material.dart';

class CustomtextPasswordfield extends StatelessWidget {
  const CustomtextPasswordfield({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.hintText,
    this.onPressed,
  });
  final TextEditingController controller;
  final bool obscureText;
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
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: obscureText
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
        ),
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
