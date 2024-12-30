import 'package:flutter/material.dart';
import 'package:flutter_guidance/Admin_DashBoard/admin_controller/admin_course_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AdminCourseController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos Dropdown'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                print(controller.selectedCategory);
              },
              child: Text("Click me")),
          Center(
            child: Obx(() {
              // If videoNames is empty, show a loading indicator
              if (controller.videoNames.isEmpty) {
                return CircularProgressIndicator();
              }

              // DropdownButton to select a video name
              return DropdownButton<String>(
                value: controller.selectedCategory.value,
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
          ),
          Obx(() {
            return DropdownButton<String>(
              value: controller.selectedLevel.value,
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
      ),
    );
    ;
  }
}
