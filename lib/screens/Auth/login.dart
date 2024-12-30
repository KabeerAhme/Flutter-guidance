import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/constants/app_colors.dart';
import 'package:flutter_guidance/constants/app_text_style.dart';
import 'package:flutter_guidance/screens/Auth/signup.dart';
import 'package:flutter_guidance/screens/Navbar/bottom_navbar.dart';
import 'package:flutter_guidance/screens/home_screen.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 40, right: 12, left: 12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Login",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text(
                      "forgot password?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Get.to(SignUp());
                    },
                    child: Text(
                      "don't have an account ?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  await controller.loginUser();
                  if (controller.userCredential != null) {
                    Get.offAll(() => BottomNav());
                  }
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
