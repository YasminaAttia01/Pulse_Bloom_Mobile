// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class GreetingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6.0,
            spreadRadius: 2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Welcome Back',
                        style:
                            TextStyle(color: Color(0xFF0B82D4), fontSize: 14),
                      ),
                      Text(
                        'John Doe',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  // Bell icon
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF0B82D4).withOpacity(0.2),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.notifications, color: Color(0xFF0B82D4)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8),
                  // Settings icon
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF0B82D4).withOpacity(0.2),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.settings, color: Color(0xFF0B82D4)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Doctors icon
              Expanded(
                child: Column(
                  children: [
                    Image.asset("assets/images/doctor.png",
                        width: 24.0, height: 24.0),
                    SizedBox(height: 4.0),
                    Text('Doctors', style: TextStyle(color: Color(0xFF0B82D4))),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  children: [
                    Image.asset("assets/images/favorite.png",
                        width: 24.0, height: 24.0),
                    SizedBox(height: 4.0),
                    Text('Favorite',
                        style: TextStyle(color: Color(0xFF0B82D4))),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF0B82D4).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Image.asset("assets/images/search.png",
                                width: 22.0, height: 22.0),
                          ),
                          SizedBox(width: 6.0),
                        ],
                      ),
                      Icon(Icons.search, color: Color(0xFF0B82D4), size: 22),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
