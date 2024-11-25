// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/BottomAppBar.dart';
import './PasswordManager.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Color(0xFF0B82D4),
          ),
        ),
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
            Expanded(
              child: ListView(
                children: [
                  _ProfileOptionItem(
                    icon: Icons.notifications_active,
                    title: 'Notification Setting',
                    onTap: () {
                      // Handle navigation for Notification Setting
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.lock,
                    title: 'Password Manager',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PasswordManager()),
                      );
                    },
                  ),
                  _ProfileOptionItem(
                    icon: Icons.delete,
                    title: 'Delete Account',
                    onTap: () {
                      // Handle navigation for Delete Account
                    },
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
