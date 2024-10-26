// views/home.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'widgets/image_widget.dart';
import 'widgets/welcome_text_widget.dart';
import 'widgets/subtitle_widget.dart';
import 'widgets/dots_indicator_widget.dart';
import 'widgets/button.dart';
import '../constants/app_colors.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.9,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.01, -1.00),
          end: Alignment(-0.01, 1),
          colors: [
            AppColors.gradientStart,
            AppColors.gradientMiddle,
            AppColors.gradientEnd,
          ],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(),
          WelcomeTextWidget(),
          SubtitleWidget(),
          DotsIndicatorWidget(),
          Button(
            buttonText: 'Get Started',
            nextScreen: NextScreen(),
          ),
        ],
      ),
    );
  }
}

// Dummy NextScreen for navigation
class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the next screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
