import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/constants/app_colors.dart';
import 'package:flutter_guidance/constants/app_text_style.dart';
import 'package:flutter_guidance/controller/auth_controller.dart';
import 'package:flutter_guidance/controller/course_controller.dart';
import 'package:flutter_guidance/controller/home_controller.dart';
import 'package:flutter_guidance/screens/course_details/course_details.dart';
import '../constants/widgets_code.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';

import 'Drawer/beautiful_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List recommendedNames = [
    "Provider",
    "Hive Database",
    "Getx",
    "SharedPreferrences",
  ];
  List recommendedImages = [
    "assets/images/recom1.png",
    "assets/images/recom2.png",
    "assets/images/recom3.png",
    "assets/images/recom4.png",
  ];

  List featureNames = [
    "Firebase",
    "API's",
    "Map Integration",
    "Push Notification",
    "Local Database",
  ];
  List feautreImages = [
    "assets/images/feature1.png",
    "assets/images/feature2.png",
    "assets/images/feature3.png",
    "assets/images/feature4.png",
    "assets/images/feature5.png",
  ];

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: BeautifulDrawer(),
      appBar: AppBar(
        actions: [
          CircleAvatar(
              backgroundColor: AppColors.primaryLight,
              child: IconButton(
                onPressed: () {
                  controller.logoutUser();
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
              )),
          SizedBox(
            width: 10,
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: AppColors.background,
        elevation: 0.0,
      ),
      backgroundColor: AppColors.background,
      body: Container(
        padding: EdgeInsets.only(top: 5, left: 18, right: 18),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Obx(() {
              return Text(
                "Hello " + controller.name.value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              );
            }),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "Good Morning !",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              "Welcome to Flutter Guidance",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Courses",
                  style: AppTextStyles.smallTitle,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: height * 0.02,
            // ),
            SizedBox(
              height: 115,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                children: [
                  CoursesList(
                    Colors.deepPurpleAccent.withOpacity(0.4),
                    Colors.deepPurple.withOpacity(0.3),
                    "assets/images/API.png",
                    "API's",
                    () {},
                  ),
                  CoursesList(
                    Colors.red.withOpacity(0.3),
                    Colors.redAccent.withOpacity(0.5),
                    "assets/images/database.png",
                    "Database",
                    () {},
                  ),
                  CoursesList(
                    Colors.blueAccent.withOpacity(0.5),
                    Colors.blue.withOpacity(0.3),
                    "assets/images/Firebase.png",
                    "Firebase",
                    () {},
                  ),
                  CoursesList(
                    Colors.tealAccent.withOpacity(0.4),
                    Colors.teal.withOpacity(0.2),
                    "assets/images/Designing.png",
                    "Designing",
                    () {},
                  ),
                  CoursesList(
                    Colors.yellow.withOpacity(0.4),
                    Colors.yellow.withOpacity(0.2),
                    "assets/images/pngwing.com (4).png",
                    "UX",
                    () {},
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Featured Classes",
                  style: AppTextStyles.smallTitle,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: height * 0.02,
            // ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: featureNames.length,
                  itemBuilder: (context, index) {
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseDetailScreen(
                                      name: featureNames[index],
                                    )));
                      },
                      child: Card(
                        elevation: 3,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, bottom: 8, top: 5),
                          // height: 220,
                          width: 160,
                          color: Colors.purple.withOpacity(0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                feautreImages[index],
                                // fit: BoxFit.cover,
                                height: 150,
                              ),
                              Spacer(),
                              Text(
                                featureNames[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  color: AppColors.primaryLight,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "4.9",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "(18 Reviews)",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/yotube_button.png",
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    "(Watch Now)",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 12,
                                    color: AppColors.primaryLight,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended For You",
                  style: AppTextStyles.smallTitle,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: TextStyle(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: recommendedNames.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    child: SizedBox(
                      width: 250, // Set a specific width for each card
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image Section
                            Flexible(
                              flex: 1,
                              child: Container(
                                color: Colors.purple.withOpacity(0.07),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    recommendedImages[index],
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Icon(Icons.image_not_supported),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    recommendedNames[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      color: AppColors.primaryLight,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          size: 15, color: Colors.yellow),
                                      SizedBox(width: 3),
                                      Text(
                                        "4.9",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 3),
                                      Text(
                                        "(18 Reviews)",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/images/yotube_button.png",
                                        height: 15,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Icon(Icons.play_circle_outline),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        "(Watch Now)",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        size: 12,
                                        color: Colors.blueAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ]),
        ),
      ),
    );
  }
}
