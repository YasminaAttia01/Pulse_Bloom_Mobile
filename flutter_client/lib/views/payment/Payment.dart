// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';
import './AddCard.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? _selectedPaymentMethod;

  void _onPaymentMethodSelected(String method) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddCardScreen()),
    );

    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Payment Method',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credit & Debit Card',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            PaymentOptionTile(
              icon: Icons.credit_card,
              text: 'Add New Card',
              selected: _selectedPaymentMethod == 'Add New Card',
              onTap: () => _onPaymentMethodSelected('Add New Card'),
            ),
            SizedBox(height: 30),
            Text(
              'More Payment Option',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            PaymentOptionTile(
              icon: Icons.apple,
              text: 'Apple Play',
              selected: _selectedPaymentMethod == 'Apple Play',
              onTap: () => _onPaymentMethodSelected('Apple Play'),
            ),
            PaymentOptionTile(
              icon: Icons.payment,
              text: 'Paypal',
              selected: _selectedPaymentMethod == 'Paypal',
              onTap: () => _onPaymentMethodSelected('Paypal'),
            ),
            PaymentOptionTile(
              icon: Icons.play_circle_outline,
              text: 'Google Play',
              selected: _selectedPaymentMethod == 'Google Play',
              onTap: () => _onPaymentMethodSelected('Google Play'),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  PaymentOptionTile({
    required this.icon,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Color(0xFFEAF2FF),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.primaryColor : Colors.transparent,
            width: selected ? 2 : 0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: Icon(
                    icon,
                    color: Color(0xFF809CFF),
                    size: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            if (selected)
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12,
                child: Icon(
                  Icons.check,
                  color: Color(0xFF809CFF),
                  size: 18,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
