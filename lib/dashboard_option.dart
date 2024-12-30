import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/Admin_DashBoard/Auth/admin_login.dart';
import 'package:flutter_guidance/screens/Auth/login.dart';
import 'package:get/get.dart';

class DashBoardOption extends StatefulWidget {
  const DashBoardOption({super.key});

  @override
  State<DashBoardOption> createState() => _DashBoardOptionState();
}

class _DashBoardOptionState extends State<DashBoardOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/images/dash.jpg'), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Black overlay
          Container(
            color:
                Colors.black.withOpacity(0.5), // Black overlay with 50% opacity
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.to(Login());
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 150,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "User Dashboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.to(AdminLogin());
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(12),
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 150,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "Admin Dashboard",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
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
