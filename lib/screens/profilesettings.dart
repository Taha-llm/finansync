import 'package:flutter/material.dart';
import 'package:hope/utils/colors.dart';
import 'package:hope/widgets/text_field_input.dart';

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
        ),
        body: Column(
          children: [
            Container(
                width: 550,
                margin: EdgeInsetsDirectional.only(start: 30,end: 30,top: 20),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: buttonsBackground),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Username',style: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: buttonsBackground2,
                        hintText: 'New Username',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(width: 0.5)),
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
                decoration: BoxDecoration(
                  border: Border.all(color: buttonsBackground),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Column(
                  children: [
                    ListTile(
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
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(width: 0.5)),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                        fillColor: buttonsBackground2,
                        hintText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(width: 0.5)),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.text,
                    )
                  ],
                )),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {},
              child: Text('Confirm',style: TextStyle(color:Colors.grey)),
            )
          ],
        ));
  }
}
