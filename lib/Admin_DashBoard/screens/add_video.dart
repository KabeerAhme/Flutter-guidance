import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/Admin_DashBoard/admin_controller/admin_course_controller.dart';
import 'package:flutter_guidance/constants/app_text_style.dart';
import 'package:flutter_guidance/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_colors.dart';

class AddVideo extends StatelessWidget {
  AddVideo({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AdminCourseController());
    var authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          CupertinoButton(
            onPressed: () {
              authController.logoutUser();
            },
            child: Icon(
              Icons.logout,
              color: AppColors.primaryLight,
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.primaryLight,
          ),
        ),
        title: Text(
          "Add New Video",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/youtube_title.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Video Title",
                style: AppTextStyles.addVideoStyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.videoTitleController,
                decoration: InputDecoration(
                  hintText: "Video Title",
                  label: Text("Video Title"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                "Video Link",
                style: AppTextStyles.addVideoStyle,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: controller.videoLinkController,
                decoration: InputDecoration(
                  hintText: "Video Link",
                  label: Text("Video Link"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Select Course",
                        style: AppTextStyles.addVideoStyle,
                      ),
                      Obx(() {
                        if (controller.videoNames.isEmpty) {
                          return CircularProgressIndicator();
                        }
                        return DropdownButton<String>(
                          value: controller.selectedCategory.value.isEmpty
                              ? controller.videoNames.isNotEmpty
                                  ? controller.videoNames[0]
                                  : null
                              : controller.selectedCategory.value,
                          items: controller.videoNames
                              .map(
                                (video) => DropdownMenuItem(
                                  value: video,
                                  child: Text(video),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              controller.selectedCategory.value = value;
                            }
                          },
                        );
                      }),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Select Level",
                        style: AppTextStyles.addVideoStyle,
                      ),
                      Obx(() {
                        return DropdownButton<String>(
                          value: controller.selectedLevel.value.isEmpty
                              ? controller.levels.isNotEmpty
                                  ? controller.levels[0]
                                  : null
                              : controller.selectedLevel.value,
                          onChanged: (value) {
                            if (value != null) {
                              controller.updateSelectedLevel(value);
                            }
                          },
                          items: controller.levels
                              .map((level) => DropdownMenuItem<String>(
                                    value: level,
                                    child: Text(level),
                                  ))
                              .toList(),
                        );
                      })
                    ],
                  )
                ],
              ),
              SizedBox(height: 20), // Added space before the button
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  String randomUid = randomAlphaNumeric(16);
                  await controller.addNewVideo(
                      randomUid,
                      controller.videoTitleController.text,
                      controller.videoLinkController.text,
                      controller.selectedCategory.value,
                      controller.selectedLevel.value);
                  // Call the function to add video (you need to define this in your controller)
                  // controller.addVideo();
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Colors.purple,
                        Colors.purpleAccent,
                      ])),
                  child: Center(
                      child: Text(
                    "Add Video",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
