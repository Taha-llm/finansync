import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hope/firebase_options.dart';
import 'package:hope/layout/screenlayout.dart';
import 'package:hope/layout/screenlayout.dart';
import 'package:hope/screens/login.dart';
import 'package:hope/screens/signup.dart';
import 'package:hope/utils/auth_gate.dart';
import 'package:hope/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinanSync',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home:const AuthGate(),
    );
  }
}
