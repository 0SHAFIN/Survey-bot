import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:microprocessor_app/screen/home.dart';
import 'package:microprocessor_app/screen/test.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: DefaultTextStyle(
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Microprocessor Project Group 4',
                speed: Duration(milliseconds: 130),
              ),
            ],
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}
