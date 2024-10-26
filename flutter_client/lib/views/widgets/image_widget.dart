// widgets/image_widget.dart
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 406,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://via.placeholder.com/407x406"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
