import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AdminCourseController extends GetxController {
  TextEditingController videoTitleController = TextEditingController();
  TextEditingController videoLinkController = TextEditingController();

  var videoNames = <String>[].obs;
  final List<String> levels = ['Beginners', 'Intermediate', 'advance'];

  var selectedCategory = ''.obs;
  var selectedLevel = 'Beginners'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchVideoNames();
  }

  Future<void> fetchVideoNames() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('videos').get();
      videoNames.value = snapshot.docs.map((doc) => doc.id).toList();

      // Set initial value for dropdown
      if (videoNames.isNotEmpty) {
        selectedCategory.value = videoNames.first;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch videos: $e');
    }
  }

  void updateSelectedLevel(String value) {
    selectedLevel.value = value;
  }

  // Future<void> fetchLevelNames(var docName, var collName) async {
  //   try {
  //     DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //         .collection('videos')
  //         .doc(docName)
  //         .get();
  //     levelNames.value = snapshot.docs.map((doc) => doc.id).toList();

  //     // Set initial value for dropdown
  //     if (levelNames.isNotEmpty) {
  //       selectedLevel.value = levelNames.first;
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to fetch videos: $e');
  //   }
  // }

  Future<void> addNewVideo(String uid, String videoName, String videoLink,
      String course, String level) async {
    try {
      var store = FirebaseFirestore.instance
          .collection('videos')
          .doc(course)
          .collection(level)
          .doc(uid);
      await store.set({
        'videoID': uid,
        'videoTitle': videoName,
        'videoLink': videoLink,
      }, SetOptions(merge: true));
      showToast(title: "Video Added", message: "Video uploaded successfully");
      print("Successfully added");
      videoTitleController.text = "";
      videoLinkController.text = "";
    } catch (e) {
      print("Error adding to WatchLater: $e");
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
