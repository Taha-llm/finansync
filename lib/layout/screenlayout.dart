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
  final List<Widget> screens = [
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
        leading: GestureDetector(
        onTap: () {
          // Navigate to the profile page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfileScreen()),
          );
        },
        child: Container(
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: .0),
          padding: EdgeInsets.symmetric(horizontal: .0), // Alignement à droite
          
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Color.fromARGB(255, 57, 57, 57),
            child: Icon(Icons.person),
          ),
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
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: gold, // Couleur dorée définie dans votre fichier colors.dart
          indicatorColor: Colors.transparent, // Supprime l'indicateur de sélection
           labelTextStyle: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            final isSelected = states.contains(MaterialState.selected);
            return TextStyle(
              fontSize: 14,
              height: 0.8,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black : Colors.black.withOpacity(0.5),
            );
          }),
        ),
        child: NavigationBar(
          height: 50, // Hauteur ajustée selon votre design
          selectedIndex: index,
          onDestinationSelected: (int newIndex) {
            setState(() => index = newIndex);
          },
          destinations: [
            NavigationDestination(
            icon: _buildIcon(Icons.account_balance_wallet_outlined, 0),
            selectedIcon: _buildIcon(Icons.account_balance_wallet, 0),
            label: 'Balance',
          ),
          NavigationDestination(
            icon: _buildIcon(Icons.home_outlined, 1),
            selectedIcon: _buildIcon(Icons.home, 1),
            label: 'Home',
          ),
          NavigationDestination(
            icon: _buildIcon(Icons.settings_outlined, 2),
            selectedIcon: _buildIcon(Icons.settings, 2),
            label: 'Settings',
          ),
          NavigationDestination(
            icon: _buildIcon(Icons.account_circle_outlined, 3),
            selectedIcon: _buildIcon(Icons.account_circle, 3),
            label: 'Profile',
          ),
        ],
      )
      ) );
  } 

  
  Widget _buildIcon(IconData icon, int destinationIndex) {
    // Utilisez une Column pour inclure à la fois l'icône et le label avec le bon espacement
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: index == destinationIndex ? Colors.black : Colors.black.withOpacity(0.5),
          size: 25,
        ),
        SizedBox(height: 4), // Espace entre l'icône et le texte
        
      ],
    );
  }
   String _labelText(int destinationIndex) {
    switch (destinationIndex) {
      case 0:
        return 'Balance';
      case 1:
        return 'Home';
      case 2:
        return 'Settings';
      case 3:
        return 'Profile';
      default:
        return '';
    };


}
}
