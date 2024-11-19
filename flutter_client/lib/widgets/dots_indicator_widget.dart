// widgets/dots_indicator_widget.dart
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DotsIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          width: 5,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}
