// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/constants.dart';
import 'package:the_wall/helpers/helepers.dart';
import 'package:the_wall/views/register%20view/register%20view%20widgets/wanna_login.dart';
import 'package:the_wall/widgets/custom_button.dart';
import 'package:the_wall/widgets/custom_text_field.dart';
import 'package:the_wall/widgets/custom_text_field_password.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final nameTextController = TextEditingController();

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isSecure1 = true;
  bool isSecure2 = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        reverse: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .21),
            const Icon(Icons.lock, size: 150),
            const SizedBox(height: 10),
            const Text(
              "Let's create an account for you ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 20),
            Customtextfield(
              controller: nameTextController,
              hintText: 'Enter your name',
            ),
            const SizedBox(height: 10),
            Customtextfield(
              controller: emailTextController,
              hintText: 'Email',
            ),
            const SizedBox(height: 10),
            CustomtextPasswordfield(
              controller: passwordTextController,
              hintText: 'Password',
              obscureText: isSecure1,
              onPressed: togglePassword1,
            ),
            const SizedBox(height: 10),
            CustomtextPasswordfield(
              controller: confirmPasswordTextController,
              hintText: 'Confirm password',
              obscureText: isSecure2,
              onPressed: togglePassword2,
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Sign Up ',
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  if (passwordTextController.text ==
                      confirmPasswordTextController.text) {
                    await singUp(
                      email: emailTextController.text,
                      password: passwordTextController.text,
                    );

                    Navigator.pop(context);
                  } else {
                    snackBarMessage(context, "Password doesn't match");
                  }
                }
              },
            ),
            const SizedBox(height: 10),
            const WannaLogin(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void togglePassword1() {
    isSecure1 = !isSecure1;
    setState(() {});
  }

  void togglePassword2() {
    isSecure2 = !isSecure2;
    setState(() {});
  }

  Future<void> singUp({
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
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      FirebaseFirestore.instance
          .collection(kUsers)
          .doc(userCredential.user!.email)
          .set(
        {
          kUserName: nameTextController.text,
          kBio: 'this is a defualt bio click on edit icon to edit it',
        },
      );

      await userCredential.user!
          .updateProfile(displayName: nameTextController.text);
      snackBarMessage(context, "Your account ctreated succefuly ");
    } on FirebaseAuthException catch (e) {
      snackBarMessage(context, e.code);
    } catch (e) {
      snackBarMessage(context, e.toString());
    }
    if (context.mounted) Navigator.of(context).pop();
  }
}
