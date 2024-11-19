// ignore_for_file: unused_field, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pulse_bloom_mobile/views/signup.dart';
import '../widgets/loginheader.dart';
import '../widgets/InputField.dart';
import '../widgets/SocialSignIn.dart';
import '../widgets/SignUpLink.dart';
import '../widgets/button.dart';
import '../constants/app_colors.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _phoneNumberError;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_phoneNumberError == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NextScreen(),
          ),
        );
      }
    }
  }

  void _validatePhoneNumber(String value) {
    setState(() {
      if (value.isEmpty) {
        _phoneNumberError = 'Please enter your mobile number';
      } else if (value.length < 8) {
        _phoneNumberError = 'Mobile number must be at least 8 digits';
      } else {
        _phoneNumberError = null;
      }
    });
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
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 400, // Matches the size of previous pages.
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
                      title: 'Log In',
                      welcomeText: 'Welcome 🖐️',
                      description:
                          'Sign in to connect, explore new features, and keep your preferences up to date for a seamless experience.',
                    ),
                    SizedBox(height: 20),
                    InputField(
                      label: 'Email',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFECF1FF)),
                        borderRadius: BorderRadius.circular(13),
                        color: Color(0xFFECF1FF),
                      ),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          _validatePhoneNumber(number.phoneNumber ?? '');
                        },
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: TextStyle(color: Colors.black),
                        formatInput: false,
                        keyboardType: TextInputType.phone,
                        inputDecoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFECF1FF),
                          border: InputBorder.none,
                          hintText: '12345678',
                          hintStyle: TextStyle(
                            color: Color(0xFF809CFF),
                            fontSize: 20,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        validator: (value) {
                          if (_phoneNumberError != null) {
                            return "";
                          }
                          return null;
                        },
                      ),
                    ),
                    if (_phoneNumberError != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          _phoneNumberError!,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    SizedBox(height: 15),
                    InputField(
                      label: 'Password',
                      obscureText: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password',
                        style: TextStyle(
                          color: Color(0xFF0B82D4),
                          fontSize: 12,
                          fontFamily: 'League Spartan',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Button(
                      buttonText: 'Log-In',
                      onPressed: _submit,
                      textColor: Colors.white,
                      backgroundColor: AppColors.primaryColor,
                    ),
                    SizedBox(height: 20),
                    SocialSignIn(),
                    SizedBox(height: 20),
                    SignUpLink(
                      normalText: 'Don’t have an account? ',
                      linkText: 'Sign Up',
                      onLinkTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                    )
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

class NextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Next Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the next screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
