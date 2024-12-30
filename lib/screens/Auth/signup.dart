import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/screens/Auth/login.dart';
import 'package:get/get.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_text_style.dart';
import '../../controller/auth_controller.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
                height: height * 0.05,
              ),
              Image.asset(
                "assets/images/signup.png",
                height: 180,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  label: Text("Name"),
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
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
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller.confirmController,
                obscureText: true,
                decoration: InputDecoration(
                  label: Text("Confirm Password"),
                  hintText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Get.to(Login());
                  },
                  child: Text(
                    "already have an account ?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  await controller.signupUser();
                  if (controller.userCredential != null) {
                    Get.offAll(() => Login());
                  }
                  print("Registered Successfully");
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
                                "SignUp",
                                style: AppTextStyles.buttonStyle,
                              ),
                            ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
