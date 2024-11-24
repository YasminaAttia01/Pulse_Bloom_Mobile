// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      decoration: BoxDecoration(
        color: Color(0xFF0B82D4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomAppBar(
          elevation: 8,
          color: Color(0xFF0B82D4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItem(
                imagePath: "assets/images/home.png",
                onTap: () => Navigator.pushNamed(context, '/patientHome'),
              ),
              NavBarItem(
                imagePath: "assets/images/chat.png",
                onTap: () => Navigator.pushNamed(context, '/chatWithDoctor'),
              ),
              NavBarItem(
                imagePath: "assets/images/profile.png",
                onTap: () => Navigator.pushNamed(context, '/userProfile'),
              ),
              NavBarItem(
                imagePath: "assets/images/calendar.png",
                onTap: () => Navigator.pushNamed(context, '/calendar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String? imagePath;
  final VoidCallback onTap;

  const NavBarItem({
    this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(imagePath!,
                  height: 28, width: 28, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
