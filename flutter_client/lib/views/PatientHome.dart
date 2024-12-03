// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/GreetingSection.dart';
import '../widgets/AppointmentCard.dart'
    as appointment_card; // Alias for AppointmentCard import
import '../widgets/doctors.dart' as doctors_widget; // Alias for doctors import
import 'package:pulse_bloom_mobile/widgets/BottomAppBar.dart';

class PatientHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomBottomNavBar(),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GreetingSection(),
              appointment_card.AppointmentCard(),
              SizedBox(height: 16),
              doctors_widget.Doctors(),
              SizedBox(height: 16),
              CustomBottomNavBar(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
