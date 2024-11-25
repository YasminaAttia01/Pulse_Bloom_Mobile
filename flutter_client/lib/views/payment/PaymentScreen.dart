// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import './paymentSuccess.dart';

void main() {
  runApp(MaterialApp(home: PaymentScreen()));
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Payment',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Amount with the same color as AppBar
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 114.5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Text(
                  '\$100.00',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Doctor Info Section
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/user.png'),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Olivia Turner, M.D.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Dermato-Endocrinology',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 2),
                        Text(
                          '5.0',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.group, color: Colors.grey, size: 16),
                        SizedBox(width: 2),
                        Text(
                          '60',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),

            // Appointment Info Section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDetailRow('Date / Hour', 'Month 24, Year / 10:00 AM'),
                  SizedBox(height: 10),
                  buildDetailRow('Duration', '30 Minutes'),
                  SizedBox(height: 10),
                  buildDetailRow('Booking for', 'Another Person'),
                  SizedBox(height: 10),
                  Divider(color: Colors.grey[300], thickness: 1),
                  SizedBox(height: 10),
                  buildDetailRow('Amount', '\$100.00'),
                  SizedBox(height: 10),
                  buildDetailRow('Duration', '30 Minutes'),
                  SizedBox(height: 10),
                  buildDetailRow('Total', '\$100.00', isBold: true),
                  SizedBox(height: 10),
                  buildDetailRow('Payment Method', 'Card',
                      trailingText: 'Change'),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Pay Now Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to another page when Pay Now is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentSuccessScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                ),
                child: Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build detail rows
  Widget buildDetailRow(String label, String value,
      {bool isBold = false, String? trailingText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: Colors.black,
          ),
        ),
        trailingText == null
            ? Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  color: isBold ? Colors.black : Colors.grey[600],
                ),
              )
            : Row(
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    trailingText,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
