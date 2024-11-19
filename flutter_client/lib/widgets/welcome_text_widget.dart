// widgets/welcome_text_widget.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constants//app_colors.dart'; // Adjust the import path as needed
import '../../constants//app_strings.dart'; // Adjust the import path as needed

class WelcomeTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        AppStrings.welcomeMessage,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 24,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
