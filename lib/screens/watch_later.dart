import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/constants/app_colors.dart';
import 'package:flutter_guidance/controller/auth_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../controller/course_controller.dart';

class WatchLater extends StatefulWidget {
  const WatchLater({super.key});

  @override
  State<WatchLater> createState() => _WatchLaterState();
}

class _WatchLaterState extends State<WatchLater> {
  @override
  Widget build(BuildContext context) {
    void _launchYouTubeLink(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    var controller = Get.put(CourseController());
    var authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          "All Videos",
          style: TextStyle(
            color: AppColors.primaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: controller.getWatchLater(authController.userEmail.value),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data?.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimationLimiter(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data?.length ?? 0, // Use the actual data length.
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 500.0,
                        child: FadeInAnimation(
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              // _launchYouTubeLink(data[index]["begFireLink"]);
                              // Get.to(
                              //   VideoPlayerScreen(
                              //     name: data[index]['videoTitle'],
                              //   ),
                              //   arguments: data[index]['videoLink'],
                              // );
                            },
                            child: Card(
                              elevation: 3,
                              child: Container(
                                margin: const EdgeInsets.only(top: 12),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.purple.withOpacity(0.7),
                                    Colors.purpleAccent,
                                  ]),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.play_circle_fill,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data![index]["videoName"],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .deleteWatchLaterVideo(
                                                          data[index]
                                                              ['watchID']);
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            data![index]["videoName"],
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.red
                                                        .withOpacity(0.7),
                                                  ),
                                                  onPressed: () {
                                                    _launchYouTubeLink(
                                                        data[index]
                                                            ["videoLink"]);
                                                  },
                                                  child: Text(
                                                    "Play in Youtube",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
