import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/constants/app_colors.dart';

import 'overview_page.dart';

class CourseDetailScreen extends StatelessWidget {
  final String name;
  CourseDetailScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0.0,
          leading: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.primaryLight,
          ),
          title: Text(
            "Course Detail",
            style: TextStyle(
              color: AppColors.primaryLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 3,
                child: Container(
                  color: Colors.purple.withOpacity(0.05),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/feature1.png', // Add your image asset here
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/yotube_button.png",
                              height: 16,
                            ),
                            SizedBox(width: 8),
                            Text(
                              "15 Lectures \t |",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "  6 hours |",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Colors.black45,
                                // fontSize: 12,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.star, color: Colors.yellow),
                            SizedBox(width: 4),
                            Text("4.9 (23 Reviews)"),
                          ],
                        ),
                        SizedBox(height: 16),
                        CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Container(
                            height: 70,
                            padding:
                                EdgeInsets.only(top: 3, left: 5, right: 10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.purple.withOpacity(0.8),
                                Colors.purpleAccent,
                              ]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.playlist_play_outlined,
                                    color: AppColors.primaryLight,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Kabeer Ahmed",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      "Flutter Developer",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white60,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TabBar(
                          labelColor: Colors.black,
                          tabs: [
                            Tab(text: "Description"),
                            Tab(text: "Overview"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 300,
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          "UX design refers to the term user experience while UI stands for user interface design. Both elements are crucial..."),
                    ),
                    OverViewPage(
                      name: name,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
