// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/utils/colors.dart'; // Ensure this path is correct
import 'package:flutter_svg/flutter_svg.dart';

class AppSettingsScreen extends StatefulWidget {
  const AppSettingsScreen({super.key});

  @override
  State<AppSettingsScreen> createState() => _AppSettingsScreenState();
}

class _AppSettingsScreenState extends State<AppSettingsScreen> {
  bool isDarkModeEnabled = false;
  bool areNotificationsEnabled = true;
  bool isSoundEnabled = true;
  bool isVibrationEnabled = true;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white ,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 50), // Adjust bottom margin for better positioning
                padding: EdgeInsets.symmetric(vertical: 80),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [gold1, gold, gold], // Make sure these colors are defined
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                
              ),
              Positioned(
                bottom: 10, // Adjust the position as needed
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    radius: 50, // Adjust size as needed
                    backgroundColor: const Color.fromARGB(255, 57, 57, 57),
                    child: Icon(
                      Icons.settings,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
           Container(
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
            ),
           SizedBox(height: 50),
          _buildSettingItem(Icons.brightness_4, 'Dark Mode', isDarkModeEnabled),
          _buildSettingItem(Icons.notification_important, 'Notifications', areNotificationsEnabled),
          _buildSettingItem(Icons.volume_up, 'Sound', isSoundEnabled),
          _buildSettingItem(Icons.vibration, 'Vibration', isVibrationEnabled),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, bool currentValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          trailing: Switch(
            activeColor: gold, // Make sure this color is defined in your colors.dart
            value: currentValue,
            onChanged: (value) {
              setState(() {
                // Update the corresponding state variable
                switch (title) {
                  case 'Dark Mode':
                    isDarkModeEnabled = value;
                    break;
                  case 'Notifications':
                    areNotificationsEnabled = value;
                    break;
                  case 'Sound':
                    isSoundEnabled = value;
                    break;
                  case 'Vibration':
                    isVibrationEnabled = value;
                    break;
                }
              });
            },
          ),
        ),
        SizedBox(height: 8.0),
        Divider(height: 1.0, color: Colors.black),
        SizedBox(height: 8.0),
      ],
    ),
    );
  }
}
