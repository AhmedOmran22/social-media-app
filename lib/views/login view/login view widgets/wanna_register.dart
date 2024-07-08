
import 'package:flutter/material.dart';
import 'package:the_wall/views/register%20view/register_view.dart';

class WannaRegister extends StatelessWidget {
  const WannaRegister({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Not a member?',
          style: TextStyle(fontSize: 18),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const RegisterView(),
              ),
            );
          },
          child: Text(
            '   Register now',
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
