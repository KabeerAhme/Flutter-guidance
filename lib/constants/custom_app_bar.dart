import 'package:flutter/material.dart';

import 'app_text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  CustomAppBar({
    required this.title,
    this.showBackButton = true,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.title,
      ),
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF000080),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      actions: actions,
      backgroundColor: Colors.transparent,
      // Set a common color
      elevation: 0.0, // Add shadow for a professional look
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
