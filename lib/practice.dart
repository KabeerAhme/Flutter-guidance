import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class YouTubeLinkScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<String> getYouTubeLink() async {
  //   // Replace 'collectionName' and 'documentId' with your Firestore path
  //   DocumentSnapshot docSnapshot =
  //       await _firestore.collection('collectionName').doc('documentId').get();
  //   if (docSnapshot.exists) {
  //     return docSnapshot['youtubeLink']; // Adjust field name accordingly
  //   } else {
  //     throw 'Document does not exist';
  //   }
  // }

  Future<QuerySnapshot<Map<String, dynamic>>> getCategoryList() async {
    var video = await FirebaseFirestore.instance
        .collection("videos")
        .doc("firebase")
        .collection("beginners")
        .get();
    return video;
  }

  void _launchYouTubeLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube Link Viewer'),
      ),
      body: FutureBuilder(
        future: getCategoryList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No link found'));
          } else {
            var data = snapshot.data?.docs;

            return ListView.builder(
                itemCount: data?.length ?? 0,
                itemBuilder: (context, index) {
                  var youtubeLink = data![index]['begVideo'];
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => _launchYouTubeLink(youtubeLink),
                      child: Text(data[index]["begVideo"]),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
