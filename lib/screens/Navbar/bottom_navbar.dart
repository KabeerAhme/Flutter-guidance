import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guidance/constants/app_colors.dart';
import 'package:flutter_guidance/screens/home_screen.dart';
import 'package:flutter_guidance/screens/profile_page.dart';
import 'package:flutter_guidance/screens/settings.dart';
import 'package:flutter_guidance/screens/watch_later.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;

  late HomeScreen homeScreen;
  late WatchLater watchLater;
  late ProfilePage profilePage;
  int currentTabIndex = 0;

  @override
  void initState() {
    homeScreen = HomeScreen();
    watchLater = WatchLater();
    profilePage = ProfilePage();
    pages = [
      homeScreen,
      watchLater,
      profilePage,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          backgroundColor: AppColors.background,
          color: AppColors.primaryLight,
          animationDuration: Duration(milliseconds: 500),
          // animationCurve: Curves.bounceInOut,
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.watch_later,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
