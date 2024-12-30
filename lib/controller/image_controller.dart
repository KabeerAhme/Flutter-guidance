import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  var selectedImage = Rx<File?>(null);

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = FirebaseAuth.instance.currentUser?.uid ?? "default";
      final savedImagePath = '${directory.path}/$fileName.jpg';

      File imageFile = File(pickedFile.path);
      await imageFile.copy(savedImagePath);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'profile_image_path_${FirebaseAuth.instance.currentUser?.uid}',
          savedImagePath);

      selectedImage.value = File(savedImagePath);
    } else {
      print("No image selected");
    }
  }

  Future<void> loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final savedImagePath = prefs.getString('profile_image_path_$userId');

      if (savedImagePath != null) {
        selectedImage.value = File(savedImagePath);
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadImage();
  }
}
