import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/layout/screenlayout.dart';
import 'package:hope/screens/home.dart';
import 'package:hope/screens/login.dart';
import 'package:hope/utils/auth.dart';
import 'package:hope/utils/colors.dart';
import 'package:hope/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void signUp(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        _auth.signUpWithEmailPassword(
          _usernameController.text,
          _emailController.text,
          _passwordController.text,
        );
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenLayout()),
            (Route<dynamic>route)=> false,);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                    "Passwords don't match! Please confirm your password."),
              ));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)),
              color: gold,
            ),
            padding: EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                //logo
                SvgPicture.asset(
                  'assets/FinanSync-logos_transparent.svg',
                  height: 64,
                ),
                const SizedBox(
                  height: 30,
                ),
                //UserName input
                TextFieldInput(
                    textEditingController: _usernameController,
                    hintText: 'Enter your Username',
                    textInputType: TextInputType.text),
                const SizedBox(
                  height: 14,
                ),
                //input mail
                TextFieldInput(
                    textEditingController: _emailController,
                    hintText: 'Enter your e-mail',
                    textInputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 14,
                ),
                //input pwd
                TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: 'Enter your password',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFieldInput(
                  textEditingController: _confirmPasswordController,
                  hintText: 'Confirm password',
                  textInputType: TextInputType.text,
                  isPass: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                //login button
                InkWell(
                  child: Container(
                    child: const Text('SignUp'),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    signUp(context);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
                //signup transition
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        "Have an account?  ",
                        style: TextStyle(color: Colors.black),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
