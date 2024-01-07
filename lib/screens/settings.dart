import 'package:flutter/material.dart';
import 'package:hope/utils/colors.dart';

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
    return ListView(
        
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('Dark Mode',style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold)),
            trailing: Switch(
              activeColor: Colors.green,
              value: isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  isDarkModeEnabled = value;
                });
              },
            ),
          ),
          Divider(height: 1.0, color: Colors.black),
          ListTile(
            title: Text('Notifications',style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold)),
            trailing: Switch(
              activeColor: Colors.green,
              value: areNotificationsEnabled,
              onChanged: (value) {
                setState(() {
                  areNotificationsEnabled = value;
                });
              },
            ),
          ),
          Divider(height: 1.0, color: Colors.black),
          ListTile(
            title: Text('Sound',style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold),),
            trailing: Switch(
              activeColor: Colors.green,
              value: isSoundEnabled,
              onChanged: (value) {
                setState(() {
                  isSoundEnabled = value;
                });
              },
            ),
          ),
          Divider(height: 1.0, color: Colors.black),
          ListTile(
            title: Text('Vibration',style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold)),
            trailing: Switch(
              activeColor: Colors.green,
              value: isVibrationEnabled,
              onChanged: (value) {
                setState(() {
                  isVibrationEnabled = value;
                });
              },
            ),
          ),
        ],
      );
  }
}