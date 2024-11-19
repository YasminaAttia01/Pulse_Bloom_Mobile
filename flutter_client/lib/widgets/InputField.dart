// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool obscureText;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? child;

  InputField({
    required this.label,
    this.obscureText = false,
    this.hintText,
    this.validator,
    this.controller,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'League Spartan',
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        child ??
            TextFormField(
              controller: controller,
              obscureText: obscureText,
              validator: validator,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFECF1FF),
                border: InputBorder.none,
                hintText: hintText ??
                    (obscureText ? '*************' : 'example@example.com'),
                hintStyle: TextStyle(
                  color: Color(0xFF809CFF),
                  fontSize: 20,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                ),
                errorStyle: TextStyle(
                  color: Colors.red,
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFECF1FF)),
                  borderRadius: BorderRadius.circular(13),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFECF1FF)),
                  borderRadius: BorderRadius.circular(13),
                ),
              ),
            ),
      ],
    );
  }
}
