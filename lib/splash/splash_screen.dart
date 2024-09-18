import 'package:flutter/material.dart';
import 'package:internship/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:Image.asset(
        "assets/logo.gif",
      
      ), 
      ),
    );
  }
}
