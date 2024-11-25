// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../views/DoctorProfile.dart';
import '../models/Doctor.dart'; // Import Doctor model only if needed
import '../widgets/doctors.dart'; // Ensure this file includes DoctorCard and other widgets

class Doctors extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: "Dr. Alexander Bennett, Ph.D.",
      specialty: "Dermato-Genetics",
      rating: 4.5,
      consultations: 40,
      imageUrl: "assets/images/user.png",
    ),
    Doctor(
      name: "Dr. Emma Watson, M.D.",
      specialty: "Cardiology",
      rating: 4.7,
      consultations: 30,
      imageUrl: "assets/images/user.png",
    ),
    Doctor(
      name: "Dr. John Smith, Ph.D.",
      specialty: "Neurology",
      rating: 4.8,
      consultations: 50,
      imageUrl: "assets/images/user.png",
    ),
    Doctor(
      name: "Dr. Mama, Ph.D.",
      specialty: "Neurology",
      rating: 4.8,
      consultations: 50,
      imageUrl: "assets/images/user.png",
    ),
    Doctor(
      name: "Dr. Yasmina, Ph.D.",
      specialty: "Neurology",
      rating: 4.8,
      consultations: 50,
      imageUrl: "assets/images/user.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctors"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isWideScreen = constraints.maxWidth > 600;
                return isWideScreen
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DoctorProfilePage(doctor: doctors[index]),
                                ),
                              );
                            },
                            child: DoctorCard(doctor: doctors[index]),
                          );
                        },
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: doctors
                              .map((doctor) => GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DoctorProfilePage(doctor: doctor),
                                        ),
                                      );
                                    },
                                    child: DoctorCard(
                                        doctor:
                                            doctor), // Ensure DoctorCard is correctly implemented
                                  ))
                              .toList(),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
