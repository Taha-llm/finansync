import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/screens/home.dart';
import 'package:hope/screens/login.dart';
import 'package:hope/screens/profile.dart';
import 'package:hope/screens/settings.dart';
import 'package:hope/screens/wallet.dart';
import 'package:hope/utils/auth.dart';
import 'package:hope/utils/colors.dart';
import 'package:hope/widgets/cryptopost.dart';
import 'package:hope/widgets/exchangepost.dart';
import 'package:hope/widgets/searchbar.dart';
import 'package:hope/widgets/stockpost.dart';
import 'package:hope/widgets/text_field_input.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int index = 1;
  final screens = [
    WalletScreen(),
    HomeScreen(),
    AppSettingsScreen(),
    ProfileScreen()
  ];

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: gold,
        leading: Container(
          alignment: Alignment.centerRight,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: buttonsBackground,
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close')),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  logout();
                                },
                                child: const Text('Sign Out'))
                          ],
                          title: const Text('Sign Out'),
                          content: const Text('You are signing out.'),
                        ));
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.black,
                size: 30,
              ))
        ],
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/FinanSync-logos_transparent.svg',
          height: 50,
        ),
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() => this.index = index),

        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: gold,
              size: 30,
            ),
            label: 'Balance',
          ),
          NavigationDestination(
              icon: Icon(
                Icons.home_filled,
                color: gold,
                size: 30,
              ),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
                color: gold,
                size: 30,
              ),
              label: 'Settings'),
          NavigationDestination(
              icon: Icon(
                Icons.account_circle,
                color: gold,
                size: 30,
              ),
              label: 'Profile')
        ],
        //onDestinationSelected: ,
      ),
    );
  }
}
