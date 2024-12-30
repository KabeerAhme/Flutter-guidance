import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/Admin_DashBoard/screens/admin_home.dart';
import 'package:get/get.dart';

import '../screens/add_video.dart';

class AdminAuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  UserCredential? userCredential;
  // bool isLoading = false.obs;
  var isLoading = false.obs;
  var name = "".obs;

  loginUser() async {
    isLoading.value = true;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (userCredential != null) {
        // Fetch user data from Firestore
        String uid = userCredential!.user!.uid;
        DocumentSnapshot userData =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        if (userData.exists) {
          if (userData['email'] == "admin@gmail.com") {
            Get.offAll(AddVideo());
          }
        } else {
          print("User data not found in Firestore.");
        }
      }
    } catch (e) {
      print("Error logging in user: $e");
      // Handle error, show a message, etc.
    } finally {
      isLoading.value = false;
    }
  }
}
