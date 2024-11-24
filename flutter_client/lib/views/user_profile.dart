// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/BottomAppBar.dart';
import '../views/home.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  File? _image;

  // Function to pick a new image using the ImagePicker package
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Update the profile picture
      });
    }
  }

  // Function to show the logout confirmation dialog
  void _showLogoutConfirmation() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Are you sure you want to logout?',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Text('Yes, Logout'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF0B82D4),
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFF0B82D4),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile',
            style: TextStyle(
              color: Color(0xFF0B82D4),
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF0B82D4),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _image == null
                      ? AssetImage('assets/images/user.png') // Default image
                      : FileImage(_image!) as ImageProvider,
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Color(0xFF0B82D4),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.edit, color: Colors.white),
                    onPressed: _pickImage,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 32),
            // Profile Options
            Expanded(
              child: ListView(
                children: [
                  _ProfileOptionItem(
                    icon: Icons.person,
                    title: 'Profile',
                    onTap: () {
                      // Navigate to Profile page
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.favorite,
                    title: 'Favorite',
                    onTap: () {
                      // Navigate to Favorite page
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.payment,
                    title: 'Payment Method',
                    onTap: () {
                      // Navigate to Payment Method page
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.lock,
                    title: 'Privacy Policy',
                    onTap: () {
                      // Navigate to Privacy Policy page
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      // Navigate to Settings page
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.help,
                    title: 'Help',
                    onTap: () {
                      // Navigate to Help page
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.exit_to_app,
                    title: 'Logout',
                    onTap: _showLogoutConfirmation,
                  ),
                ],
              ),
            ),

            CustomBottomNavBar(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// Profile Option Item Widget
class _ProfileOptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileOptionItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xFF0B82D4),
      ),
      title: Text(title),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Color(0xFF0B82D4),
      ),
      onTap: onTap,
    );
  }
}
