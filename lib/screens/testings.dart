import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_guidance/controller/course_controller.dart';
import 'package:get/get.dart';

// Future<DocumentSnapshot<Map<String, dynamic>>> getFirebaseDoc() async {
//   var doctor = await FirebaseFirestore.instance
//       .collection("videos")
//       .doc(
//           "Firebase") // Assuming you're fetching a specific document "Firebase"
//       .get();
//   return doctor;
// }

class FirebaseDocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CourseController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Document"),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: controller.getFirebaseDoc("Firebase"), // Fetch the document
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // While the data is loading
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // If there is an error fetching the data
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            // If no data is found or the document doesn't exist
            return Center(child: Text('No data available.'));
          } else {
            // If the data is successfully fetched
            var doctor = snapshot.data!.data();
            return ListView(
              children: [
                ListTile(
                  title: Text(doctor?['level'] ?? 'No name available'),
                  subtitle: Text(doctor?['level2'] ?? 'No specialty available'),
                ),
                // You can add more fields from the document if needed
              ],
            );
          }
        },
      ),
    );
  }
}
