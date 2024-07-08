
import 'package:flutter/material.dart';

class WannaLogin extends StatelessWidget {
  const WannaLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'already have an account?',
          style: TextStyle(fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Text(
            '   Sign in',
            style: TextStyle(
              color: Colors.blue[600],
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
