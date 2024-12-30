import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/controller/auth_controller.dart';
import 'package:flutter_guidance/controller/image_controller.dart';
import 'package:flutter_guidance/screens/Navbar/bottom_navbar.dart';
import 'package:flutter_guidance/screens/watch_later.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../profile_page.dart';

class BeautifulDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    var drawerController = Get.put(ProfileController());
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple.shade400, AppColors.primaryLight],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Custom Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade400, AppColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(() {
                    return drawerController.selectedImage.value != null
                        ? CircleAvatar(
                            radius: 80,
                            backgroundImage: FileImage(
                                drawerController.selectedImage.value!),
                          )
                        : CircleAvatar(
                            radius: 80,
                            child: Icon(Icons.person, size: 80),
                          );
                  }),
                  SizedBox(height: 12),
                  Text(
                    controller.name.value,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    controller.userEmail.value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            // Drawer Menu Items
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.to(BottomNav());
              },
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white),
                title: Text("Home", style: TextStyle(color: Colors.white)),
                trailing: _trailingIcon(),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.to(ProfilePage());
              },
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text("Profile", style: TextStyle(color: Colors.white)),
                trailing: _trailingIcon(),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Get.to(WatchLater());
              },
              child: ListTile(
                leading: Icon(Icons.watch_later, color: Colors.white),
                title:
                    Text("Watch Later", style: TextStyle(color: Colors.white)),
                trailing: _trailingIcon(),
              ),
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                controller.logoutUser();
              },
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Logout", style: TextStyle(color: Colors.white)),
                trailing: _trailingIcon(),
              ),
            ),
            Divider(color: Colors.white54),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Other Options",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text("About Us", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.feedback, color: Colors.white),
              title: Text("Feedback", style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Trailing arrow widget
  Widget _trailingIcon() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.black54,
          size: 16,
        ),
      ),
    );
  }
}
