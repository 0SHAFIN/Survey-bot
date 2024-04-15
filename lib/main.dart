import 'package:flutter/material.dart';
import 'package:microprocessor_app/screen/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
