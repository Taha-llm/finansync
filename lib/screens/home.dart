import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/screens/login.dart';
import 'package:hope/utils/colors.dart';
import 'package:hope/widgets/cryptopost.dart';
import 'package:hope/widgets/exchangepost.dart';
import 'package:hope/widgets/searchbar.dart';
import 'package:hope/widgets/stockpost.dart';
import 'package:hope/widgets/text_field_input.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(110, 8),
                  foregroundColor: gold,
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: buttonsBackground,
                ),
                onPressed: () {},
                child: const Text('Stock'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(110, 8),
                  foregroundColor: gold,
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: buttonsBackground,
                ),
                onPressed: () {},
                child: const Text('Crypto'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(110, 8),
                  foregroundColor: gold,
                  textStyle: const TextStyle(fontSize: 18),
                  backgroundColor: buttonsBackground,
                ),
                onPressed: () {},
                child: const Text('Exchange'),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 80),
            child: SearchArea(),
          ),
          Expanded(
              child: Container(
            child: PageView(
              children: [
                ListView(
                  children: [
                    StocksPost(),
                    StocksPost(),
                    StocksPost(),
                    StocksPost(),
                  ],
                ),
                ListView(
                  children: [
                    CryptoPost(),
                    CryptoPost(),
                    CryptoPost(),
                    CryptoPost(),
                  ],
                ),
                ListView(
                  children: [
                    ExchangePost(),
                    ExchangePost(),
                    ExchangePost(),
                    ExchangePost(),
                  ],
                )
              ],
            ),
          ))
        ],
      );
  }
}