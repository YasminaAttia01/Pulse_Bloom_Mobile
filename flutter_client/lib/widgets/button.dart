// widgets/button.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constants/app_colors.dart'; // Import your colors file

class Button extends StatelessWidget {
  final String buttonText; // Parameter for button text
  final VoidCallback onPressed; // New parameter for onPressed callback
  final Color textColor; // Parameter for text color
  final Color backgroundColor; // Parameter for background color

  Button({
    required this.buttonText,
    required this.onPressed, // Change this to onPressed
    this.textColor = Colors.white, // Default text color
    this.backgroundColor = AppColors.buttonColor, // Default background color
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Use the onPressed callback for tap action
      child: Container(
        width: 229,
        height: 45,
        decoration: BoxDecoration(
          color: backgroundColor, // Use the background color parameter
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            buttonText, // Use the button text parameter
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor, // Use the text color parameter
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
