import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'product_list_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ProductListPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,  // Makes the image fill the entire screen
        children: [
          Image.asset(
            'assets/Starting logo.jpg',  // Replace with your image path
            fit: BoxFit.cover,  // Ensures the image covers the entire screen
          ),
          Positioned(
            bottom: 30.0,
            left: 0,
            right: 0,
            child: Center(
              child: SpinKitFadingCircle(  // Optional spinner animation
                color: Colors.white,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
