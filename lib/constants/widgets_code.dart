import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CoursesList(
  Color color1,
  color2,
  String img,
  name,
  VoidCallback onPress,
) {
  return CupertinoButton(
    padding: EdgeInsets.zero,
    onPressed: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 5),
      height: 110,
      width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            img,
            height: 60,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
