// main.dart
// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'views/home.dart';
import './views/PatientHome.dart'; // Import your patient home page
import 'views/chat_with_doctor.dart'; // Import your chat with doctor page
import './views/profile/user_profile.dart'; // Import your user profile page
import 'views/calendar.dart'; // Import your calendar page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseBloom',
      theme: ThemeData(
        primarySwatch: _createMaterialColor(Color(0xFF809CFF)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/patientHome': (context) => PatientHome(),
        //'/chatWithDoctor': (context) =>
        //  ChatWithDoctorPage(), // Uncommented the chat route
        '/userProfile': (context) => UserProfilePage(),
        //'/calendar': (context) =>
        //  CalendarPage(), // Uncommented the calendar route
      },
    );
  }

  // Method to create a MaterialColor from a Color
  MaterialColor _createMaterialColor(Color color) {
    Map<int, Color> swatch = {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color, // Base color
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    };
    return MaterialColor(color.value, swatch);
  }
}
