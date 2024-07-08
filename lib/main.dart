import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/firebase_options.dart';

import 'auth/aurh.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TheWallApp());
}

class TheWallApp extends StatelessWidget {
  const TheWallApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthView(),
    );
  }
}
