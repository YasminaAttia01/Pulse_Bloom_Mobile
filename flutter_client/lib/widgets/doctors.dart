// ignore_for_file: unused_local_variable, use_key_in_widget_constructors, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import '../views/doctor/DoctorProfile.dart';
import '../views/doctor/Doctors.dart';
import '../models/Doctor.dart';

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
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
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
                        return DoctorCard(doctor: doctors[index]);
                      },
                    )
                  : Column(
                      children: doctors
                          .map((doctor) => DoctorCard(doctor: doctor))
                          .toList(),
                    );
            },
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DoctorsWidget(doctors: doctors)),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text(
                'Discover more doctors',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorCard({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the doctor's profile page and pass the doctor data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorProfilePage(doctor: doctor),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xFFE8F3FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage(doctor.imageUrl ?? 'assets/images/user.png'),
              radius: 30,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          doctor.specialty,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              '${doctor.rating}',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                            Icon(Icons.star, color: Colors.blue, size: 18),
                          ],
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '${doctor.consultations}',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                      Icon(Icons.comment, color: Colors.blue, size: 18),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.favorite_border, color: Colors.blue),
                        onPressed: () {
                          // Handle favorite action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
