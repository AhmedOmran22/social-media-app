// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/helpers/helepers.dart';
import 'package:the_wall/views/login%20view/login%20view%20widgets/wanna_register.dart';
import 'package:the_wall/widgets/custom_button.dart';
import 'package:the_wall/widgets/custom_text_field.dart';
import 'package:the_wall/widgets/custom_text_field_password.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .25),
            const Icon(Icons.lock, size: 150),
            const SizedBox(height: 10),
            const Text(
              "welcome back , you've been missed",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            Customtextfield(
              controller: emailTextController,
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            CustomtextPasswordfield(
              controller: passwordTextController,
              hintText: 'Password',
              obscureText: isSecure,
              onPressed: togglePassword,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Sign in',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  await signIn(
                    email: emailTextController.text,
                    password: passwordTextController.text,
                  );
                }
              },
            ),
            const SizedBox(height: 10),
            const WannaRegister(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void togglePassword() {
    isSecure = !isSecure;
    setState(() {});
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      },
    );
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      snackBarMessage(context, e.code);
      if (context.mounted) Navigator.of(context).pop();
    } catch (e) {
      snackBarMessage(context, e.toString());
      if (context.mounted) Navigator.of(context).pop();
    }
  }
}
