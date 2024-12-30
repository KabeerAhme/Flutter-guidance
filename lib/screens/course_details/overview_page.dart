import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_guidance/controller/course_controller.dart';
import 'package:flutter_guidance/screens/course_details/all_videos.dart';
import 'package:get/get.dart';

// Future<DocumentSnapshot<Map<String, dynamic>>> getFirebaseDoc() async {
//   var doctor = await FirebaseFirestore.instance
//       .collection("videos")
//       .doc(
//           "Firebase") // Assuming you're fetching a specific document "Firebase"
//       .get();
//   return doctor;
// }

class OverViewPage extends StatelessWidget {
  String name;
  OverViewPage({required this.name});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CourseController());

    return Scaffold(
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
            var fire = snapshot.data!.data();
            return ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AllVideos(
                                docName: name, colName: "Beginners")));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Adjust the value as needed
                    ),
                    elevation: 3,
                    child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.purple.withOpacity(0.08),
                            Colors.pinkAccent.withOpacity(0.09),
                          ]),
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/yotube_button.png",
                              height: 30,
                            ),
                            title: Text(name),
                            subtitle: Text(fire?["level"]),
                            trailing: Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Adjust the value as needed
                  ),
                  elevation: 3,
                  child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.purple.withOpacity(0.08),
                          Colors.pinkAccent.withOpacity(0.09),
                        ]),
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/yotube_button.png",
                            height: 30,
                          ),
                          title: Text(name),
                          subtitle: Text(fire?["level2"]),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15), // Adjust the value as needed
                  ),
                  elevation: 3,
                  child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.purple.withOpacity(0.08),
                          Colors.pinkAccent.withOpacity(0.09),
                        ]),
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Image.asset(
                            "assets/images/yotube_button.png",
                            height: 30,
                          ),
                          title: Text(name),
                          subtitle: Text(fire?["level3"]),
                          trailing: Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.black,
                          ),
                        ),
                      )),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
