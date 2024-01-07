import 'package:flutter/material.dart';
import 'package:hope/screens/login.dart';
import 'package:hope/screens/profilesettings.dart';
import 'package:hope/utils/colors.dart';
import 'package:hope/widgets/portoliopost.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            child:Text('10.000\$', style: TextStyle(fontWeight: FontWeight.bold,fontSize:50 ),),
            margin: const EdgeInsets.only(bottom: 50),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [gold1, gold, gold]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
          ),
        ),
        ListTile(
          title: Text('Portfolio',style: TextStyle(color:Colors.grey[700],fontWeight: FontWeight.bold),),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(bottom: 30,left: 15,right: 15),
          decoration: BoxDecoration(border:Border.all(color: buttonsBackground),borderRadius: BorderRadius.circular(10)),
          child: 
          ListView(
            children: [
              PortfolioPost(),
              PortfolioPost(),
              PortfolioPost(),
            ],
          ),
          ),
        ),
      ],
    );
  }
}
