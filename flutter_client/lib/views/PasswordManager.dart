import 'package:flutter/material.dart';

import '../widgets/loginheader.dart';
import '../widgets/InputField.dart';
import '../widgets/button.dart';
import '../constants/app_colors.dart';

class PasswordManager extends StatefulWidget {
  @override
  _PasswordManagerState createState() => _PasswordManagerState();
}

class _PasswordManagerState extends State<PasswordManager> {
  // Controllers for each field
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to handle form submission
  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Simulate a password change success
      _showSuccessDialog();
    }
  }

  // Show success dialog after password change
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Password changed successfully 👌'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pop(
                    context); // Optionally go back to the previous page
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LoginHeader(
                      title: 'Password Manager',
                      welcomeText: '',
                      description: '',
                    ),
                    InputField(
                      label: 'Current Password',
                      obscureText: true,
                      controller: _currentPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your current password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    InputField(
                      label: 'New Password',
                      obscureText: true,
                      controller: _newPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a new password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    InputField(
                      label: 'Confirm New Password',
                      obscureText: true,
                      controller: _confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm your new password';
                        } else if (value != _newPasswordController.text) {
                          return 'Passwords do not match';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                    ),
                    SizedBox(height: 20),
                    Button(
                      buttonText: 'Change Password',
                      onPressed: _submit,
                      textColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
