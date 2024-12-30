import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/constants/app_colors.dart';
import 'package:flutter_guidance/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../controller/image_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());
  var authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // leading: CupertinoButton(
        //   padding: EdgeInsets.zero,
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Icon(
        //     Icons.arrow_back_ios_new_outlined,
        //     color: AppColors.primaryLight,
        //   ),
        // ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: AppColors.primaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return controller.selectedImage.value != null
                    ? CircleAvatar(
                        radius: 80,
                        backgroundImage:
                            FileImage(controller.selectedImage.value!),
                      )
                    : CircleAvatar(
                        radius: 80,
                        child: Icon(Icons.person, size: 80),
                      );
              }),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryLight,
                ),
                onPressed: () => controller.pickImage(), // Pick new image
                child: Text(
                  "Upload Image",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 3,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.background,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      // top: ,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Name :",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "" + " " + authController.name.value,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 3,
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.background,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      // top: 16,
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Email :",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "" + " " + authController.userEmail.value,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
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
                  authController.logoutUser();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      size: 30,
                    ),
                    title: Text(
                      "LogOut",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.logout,
                      size: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_box,
                      size: 30,
                    ),
                    title: Text(
                      "Delete Account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.delete,
                      size: 30,
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
