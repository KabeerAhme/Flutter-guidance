import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/Admin_DashBoard/admin_controller/admin_auth_controller.dart';
import 'package:flutter_guidance/constants/app_colors.dart';
import 'package:flutter_guidance/constants/app_text_style.dart';
import 'package:flutter_guidance/screens/Auth/signup.dart';
import 'package:flutter_guidance/screens/Navbar/bottom_navbar.dart';
import 'package:flutter_guidance/screens/home_screen.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class AdminLogin extends StatelessWidget {
  const AdminLogin({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var controller = Get.put(AdminAuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 12, left: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Admin Login",
                  style: AppTextStyles.bigTitle,
                ),
              ),
              SizedBox(
                height: height * 0.1,
              ),
              Image.asset(
                "assets/images/login.png",
                height: 180,
              ),
              SizedBox(
                height: height * 0.1,
              ),
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              // SizedBox(
              //   height: height * 0.02,
              // ),

              SizedBox(
                height: height * 0.05,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  await controller.loginUser();
                  // if (controller.userCredential != null) {
                  //   Get.offAll(() => BottomNav());
                  // }
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Obx(
                    () => controller.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : Center(
                            child: Text(
                              "Login",
                              style: AppTextStyles.buttonStyle,
                            ),
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
