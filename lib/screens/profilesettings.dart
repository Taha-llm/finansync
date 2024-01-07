// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/utils/colors.dart';
import 'package:hope/widgets/text_field_input.dart';
import 'package:hope/screens/profile.dart';


class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: gold,
          title: Text(
            'Profile Settings',
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          ),
          actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            
          ),
        ],
          toolbarHeight: 90.0,
        ),
        body: Column(
          children: [
            Container(
                width: 550,
                margin: EdgeInsetsDirectional.only(start: 30,end: 30,top: 20),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 0.0),
                      title: Text(
                        'Username',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: buttonsBackground2,
                        hintText: 'New Username',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black, width: 3.0)), // Bordure rouge, par exemple
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: gold, width: 3.0)),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.text,
                    )
                  ],
                )),
              Container(
                width: 550,
                margin: EdgeInsetsDirectional.only(start: 30,end: 30,top: 20),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
               
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 0.0),
                      title: Text(
                        'Password',
                        style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: buttonsBackground2,
                        hintText: 'New Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black, width: 3.0)), // Bordure rouge, par exemple
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: gold, width: 3.0)),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 30),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: buttonsBackground2,
                        hintText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: Colors.black, width: 3.0)), // Bordure rouge, par exemple
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: BorderSide(color: gold, width: 3.0)),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.text,
                    )
                  ],
                )),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              },
              child: Text(
                'Confirm',
                style: TextStyle(
                  fontSize: 16, // Augmenter la taille du texte si nécessaire
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: buttonsBackground2, // Couleur de fond
                onPrimary: const Color.fromARGB(255, 158, 156, 156), // Couleur du texte
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bords arrondis
                ),
                side: BorderSide(color: Colors.black, width: 3.0), // Bordure
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Augmenter l'espacement interne
              ),
            )

          ],
        ));
  }
}
