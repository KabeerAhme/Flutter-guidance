import 'package:flutter/material.dart';
import 'package:flutter_guidance/Admin_DashBoard/screens/add_video.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../controller/auth_controller.dart';
import '../dashboard_option.dart';
import 'Auth/login.dart';
import 'Navbar/bottom_navbar.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    _navigateBasedOnAuth();
  }

  Future<void> _navigateBasedOnAuth() async {
    await Future.delayed(const Duration(seconds: 7)); // Simulated splash delay

    if (authController.isUserLoggedIn.value) {
      if (authController.userEmail.value == "admin@gmail.com") {
        Get.offAll(() => AddVideo());
      } else {
        Get.offAll(() => BottomNav());
      }
      // Navigate to Home Screen
    } else {
      Get.offAll(() => DashBoardOption()); // Navigate to Login Screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFECE3F0), // Soft Lavender (Light)
              Color(0xFFD1B3F1), // Light Purple
              Color(0xFFB68CD4), // Slightly darker but soft purple
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash_screen.png",
                height: 100,
              ),
              SizedBox(height: 20),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    "Flutter Guidance",
                    textStyle: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                      shadows: [
                        Shadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    speed: Duration(milliseconds: 130),
                  ),
                  FadeAnimatedText(
                    "Welcome to the App!",
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white70, // Soft white for subtitle
                    ),
                  ),
                ],
                totalRepeatCount: 1,
                pause: Duration(milliseconds: 500),
                displayFullTextOnTap: true,
              ),
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '"Code once, delight everywhere—Flutter makes it possible."',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
