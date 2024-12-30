import 'package:flutter/material.dart';
import 'package:flutter_guidance/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle buttonStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25,
    color: Color.fromARGB(255, 219, 198, 198),
  );

  static const TextStyle addVideoStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle smallTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bigTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 40,
    color: AppColors.primaryLight,
  );

  // APpBar Title

  static const TextStyle title = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Color(0xFF000080),
  );

  // Heading TextStyle
  static const TextStyle heading = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Subheading TextStyle
  static const TextStyle subHeading = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.grey,
  );

  // Body TextStyle
  static const TextStyle bodyText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  // Caption TextStyle
  static const TextStyle caption = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  // Button TextStyle
  static const TextStyle button = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
