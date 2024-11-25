// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../PatientHome.dart';

void main() {
  runApp(MaterialApp(
    home: PaymentSuccessScreen(),
    routes: {
      '/patientHome': (context) => PatientHome(),
    },
  ));
}

class PaymentSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Set the background color here
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Payment Success',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors
                  .white, // Set icon color to white to contrast with background
              size: 80,
            ),
            SizedBox(height: 20),
            Text(
              'Congratulations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors
                    .white, // Set text color to white to contrast with background
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Payment is Successfully',
              style: TextStyle(
                  fontSize: 18, color: Colors.white), // Set text color to white
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.primaryColor, // Container background color
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.white, // White border
                  width: 2, // Border width
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You have successfully booked an appointment with:',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white), // White text color
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Dr. Olivia Turner, M.D.',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white), // White text color
                  ),
                  Text(
                    'Dermatology',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white), // White text color
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Date / Hour',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white), // White text color
                  ),
                  Text(
                    'Month 24, Year / 10:00 AM',
                    style: TextStyle(
                        fontSize: 16, color: Colors.white), // White text color
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Go to Home Button with updated design
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/patientHome');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                shadowColor: Colors.black.withOpacity(0.25),
                elevation: 5,
              ),
              child: Text(
                'Go to Home',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
