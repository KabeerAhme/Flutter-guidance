import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/screens/Auth/login.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  var isLoading = false.obs;
  var name = "".obs;
  var userEmail = "".obs;
  var isUserLoggedIn = false.obs;

  UserCredential? userCredential;

  @override
  void onInit() {
    super.onInit();
    checkUserLoggedIn();
  }

  void checkUserLoggedIn() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      isUserLoggedIn.value = true;
      await fetchUserData(user.uid);
      print("User already logged in: ${user.email}");
    } else {
      isUserLoggedIn.value = false;
      print("No user logged in.");
    }
  }

  Future<void> fetchUserData(String uid) async {
    try {
      DocumentSnapshot userData =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userData.exists) {
        name.value = userData["name"];
        userEmail.value = userData["email"];
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> signupUser() async {
    isLoading.value = true;
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      showToast(
        title: "Registered Successfully",
        message: "Your Account Created",
      );

      if (userCredential != null) {
        await storeUserData(
          userCredential!.user!.uid,
          nameController.text.trim(),
          emailController.text.trim(),
        );
        isUserLoggedIn.value = true;
      }
    } catch (e) {
      print("Error signing up user: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> storeUserData(String uid, String fullname, String email) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': fullname,
        'email': email,
      });
      print("User data stored successfully.");
    } catch (e) {
      print("Error storing user data: $e");
    }
  }

  Future<void> loginUser() async {
    isLoading.value = true;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (userCredential != null) {
        await fetchUserData(userCredential!.user!.uid);
        isUserLoggedIn.value = true;
      }
    } catch (e) {
      print("Error logging in user: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      isUserLoggedIn.value = false;
      name.value = "";
      userEmail.value = "";

      showToast(
        title: "Logout",
        message: "You have been logged out successfully!",
      );

      Get.offAll(() => Login());
    } catch (e) {
      showToast(
        title: "Error",
        message: "Something went wrong while logging out.",
      );
    }
  }

  void showToast({required String title, required String message}) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.black87,
      colorText: Colors.white,
      borderRadius: 8,
      margin: EdgeInsets.all(10),
      icon: Icon(Icons.notifications, color: Colors.white),
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      reverseAnimationCurve: Curves.easeInBack,
    );
  }
}
