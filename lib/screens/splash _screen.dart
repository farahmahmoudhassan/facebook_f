import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 5), () {
      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 220),
            Center(
              child: Image.asset(
                "assets/image/facebook_logo.png",
                height: 100,
                width: 100,
              ),
            ),

            Spacer(),

            Center(
              child: Image.asset(
                "assets/image/Meta_logo.png",
                height: 59,
                width: 98,
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
