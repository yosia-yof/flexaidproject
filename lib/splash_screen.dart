import 'package:flutter/material.dart';
import 'dart:async';

import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timer to navigate after a certain duration (e.g., 3 seconds)
    Timer(Duration(seconds: 3), _navigateToHome);
  }

  void _navigateToHome() {
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Make the stack cover the full screen
        children: <Widget>[
          // Background Image
          Image.asset(
            'images/flexaidSplash.png', // Replace with your image
            fit: BoxFit.cover, // Make sure the image covers the entire screen
          ),
          // Overlay content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // App Name and Tagline
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                    shadows: [Shadow(color: Colors.black, blurRadius: 10)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
