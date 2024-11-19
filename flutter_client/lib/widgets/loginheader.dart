// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final String title;
  final String welcomeText;
  final String description;

  LoginHeader({
    required this.title,
    required this.welcomeText,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF0B82D4),
              fontSize: 24,
              fontFamily: 'League Spartan',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          welcomeText,
          style: TextStyle(
            color: Color(0xFF0B82D4),
            fontSize: 24,
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Text(
          description,
          style: TextStyle(
            color: Color(0xFF070707),
            fontSize: 12,
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
