// main.dart
// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'views/home.dart';
import 'views/PatientHome.dart'; // Import your patient home page
import 'views/chat_with_doctor.dart'; // Import your chat with doctor page
import 'views/user_profile.dart'; // Import your user profile page
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
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/patientHome': (context) => PatientHome(),
        //'/chatWithDoctor': (context) => ChatWithDoctorPage(),
        '/userProfile': (context) => UserProfilePage(),
        //'/calendar': (context) => CalendarPage(),
      },
    );
  }
}
