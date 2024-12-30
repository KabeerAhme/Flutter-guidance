import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var name = "User".obs;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorList() async {
    var video = await FirebaseFirestore.instance
        .collection("doctors")
        .doc("Firebase")
        .collection("Beginner")
        .get();
    return video;
  }

  Future<void> getNameFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedName = prefs.getString('name');
    name.value = storedName ?? "User";
  }
}
