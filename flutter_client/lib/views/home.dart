// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pulse_bloom_mobile/views/Welcome.dart';
import '../widgets/welcome_text_widget.dart';
import '../widgets/subtitle_widget.dart';
import '../widgets/dots_indicator_widget.dart';
import '../widgets/button.dart';
import '../constants/app_colors.dart';
import '../responsive/responsive.dart'; // Import responsive.dart

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define screenSize using MediaQuery to get screen width and height
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenSize.width * 0.9, // Adjust width based on screen size
          height: screenSize.height * 0.9, // Adjust height based on screen size
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
    final screenSize =
        MediaQuery.of(context).size; // Define screenSize again in _buildContent

    return Container(
      width: double.infinity,
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Image.asset(
              'assets/images/Hello.png',
              fit: BoxFit.contain,
              width: Responsive.isMobile(context)
                  ? screenSize.width * 0.6
                  : Responsive.isTablet(context)
                      ? screenSize.width * 0.5
                      : screenSize.width * 0.4,
            ),
            SizedBox(height: 20),
            WelcomeTextWidget(),
            SizedBox(height: 10),
            SubtitleWidget(),
            SizedBox(height: 20),
            DotsIndicatorWidget(),
            SizedBox(height: 30),
            Button(
              buttonText: 'Get Started',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Welcome()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
