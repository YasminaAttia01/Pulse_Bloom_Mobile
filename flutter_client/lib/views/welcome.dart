// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names, non_constant_identifier_names, library_prefixes

import 'package:flutter/material.dart';
import 'package:pulse_bloom_mobile/views/authentication/login.dart';
import 'package:pulse_bloom_mobile/views/authentication/signup.dart'
    as signupPage;
import '../widgets/button.dart';
import '../constants/app_colors.dart';

class Welcome extends StatelessWidget {
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/welcome.png'),
          SizedBox(height: 30),
          Button(
            buttonText: 'Log-In',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogIn()),
              );
            },
            textColor: Colors.white,
            backgroundColor: AppColors.primaryColor,
          ),
          SizedBox(height: 20),
          Button(
            buttonText: 'Sign-Up',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => signupPage.SignUp()),
              );
            },
            textColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
