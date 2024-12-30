import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseController extends GetxController {
  Future<DocumentSnapshot<Map<String, dynamic>>> getFirebaseDoc(
      String docName) async {
    var video = await FirebaseFirestore.instance
        .collection("videos")
        .doc(docName)
        .get();
    return video;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getSubCategory(
      String docName, String colName) async {
    var vidCat = await FirebaseFirestore.instance
        .collection("videos")
        .doc(docName)
        .collection(colName)
        .get();
    return vidCat;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getWatchLater(
      var userEmail) async {
    var watchLater = await FirebaseFirestore.instance
        .collection("watchLater")
        .where('email', isEqualTo: userEmail)
        .get();
    return watchLater;
  }

  void _launchYouTubeLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // addToWatchLater(
  //     String uid, String fullname, videoName, videoLink, course, level) async {
  //   var store = FirebaseFirestore.instance.collection('users').doc(uid);
  //   await store.set({
  //     'name': fullname,
  //     'videoName': videoName,
  //     'videoLink': videoLink,
  //     'course': course,
  //     'level': level,
  //   });
  // }
  Future<void> addToWatchLater(String uid, String fullname, String videoName,
      String videoLink, String course, String level, String userEmail) async {
    try {
      var store = FirebaseFirestore.instance.collection('watchLater').doc(uid);
      await store.set({
        'watchID': uid,
        'name': fullname,
        'videoName': videoName,
        'videoLink': videoLink,
        'course': course,
        'level': level,
        'email': userEmail,
      }, SetOptions(merge: true));
      showToast(
        title: "Added Successfully",
        message: "Video Added Successfully!",
      );
      print("Successfully added to WatchLater");
    } catch (e) {
      print("Error adding to WatchLater: $e");
    }
  }

  deleteWatchLaterVideo(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection("watchLater")
          .doc(docId)
          .delete();
      showToast(
        title: "Deleted",
        message: "Video Deleted Successfully!",
      );
    } catch (e) {
      print("Error deleting document: $e");
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
