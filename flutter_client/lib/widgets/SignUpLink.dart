// ignore_for_file: file_names, use_super_parameters

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpLink extends StatelessWidget {
  final String normalText;
  final String linkText;
  final TextStyle normalTextStyle;
  final TextStyle linkTextStyle;
  final VoidCallback onLinkTap;

  const SignUpLink({
    Key? key,
    this.normalText = 'Don’t have an account? ',
    this.linkText = 'Sign Up',
    this.normalTextStyle = const TextStyle(
      color: Color(0xFF070707),
      fontSize: 12,
      fontFamily: 'League Spartan',
      fontWeight: FontWeight.w300,
    ),
    this.linkTextStyle = const TextStyle(
      color: Color(0xFF0B82D4),
      fontSize: 12,
      fontFamily: 'League Spartan',
      fontWeight: FontWeight.w500,
    ),
    required this.onLinkTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: normalText,
            style: normalTextStyle,
          ),
          TextSpan(
            text: linkText,
            style: linkTextStyle,
            recognizer: TapGestureRecognizer()..onTap = onLinkTap,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
