// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'or sign up with',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF070707),
            fontSize: 12,
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CircleAvatar(
                radius: 20, // The CircleAvatar size
                backgroundColor: Color(0xFFCAD6FF),
                backgroundImage: AssetImage(
                  'null',
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/social_icon_${index + 1}.png',
                    width: 16, // Reduced image size
                    height: 16, // Reduced image size
                    fit: BoxFit
                        .scaleDown, // Ensures the image scales down to fit the CircleAvatar
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
