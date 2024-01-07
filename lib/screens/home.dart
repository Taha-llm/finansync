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
import 'package:hope/Model/coinModel.dart';
import 'package:hope/Model/stockModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http/http.dart' as http;
import 'package:hope/View/Components/item.dart';
import 'package:hope/View/Components/item2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRefreshing = true;
  List? coinMarket = [];
  var coinMarketList;

  List? stockMarket = [];
  var stockMarketList;

  @override
  void initState() {
    getCoinMarket();
    getStockMarket();
    super.initState();
  }

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
            ),
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: stockMarket!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return StocksPost(
                            stock: stockMarket![index],
                            coin : coinMarket![index]
                          );
                        },
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: [
  ExchangePost(amount: 100, value: 0.2953647, symbol: 'EUR',flag : "TN"),
  ExchangePost(amount: 100, value: 0.32298052, symbol: 'USD',flag : "TN"),
  ExchangePost(amount: 100, value: 0.25427194, symbol: 'GBP',flag : "TN"),
  ExchangePost(amount: 100, value: 0.27483898, symbol: 'CHF',flag : "TN"),
  ExchangePost(amount: 100, value: 0.43170808, symbol: 'CAD',flag : "TN"),
  ExchangePost(amount: 100, value: 46.78203463, symbol: 'JPY',flag : "TN"),
  ExchangePost(amount: 100, value: 43.4238323, symbol: 'DZD',flag : "TN"),
  ExchangePost(amount: 100, value: 1.17564774, symbol: 'QAR',flag : "TN"),
  ExchangePost(amount: 100, value: 1.21117555, symbol: 'SAR',flag : "TN"),
  ExchangePost(amount: 100, value: 29.50859177, symbol: 'RUB',flag : "TN"),
                  ],
                ),
                ListView(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 15,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CryptoPost(
                            coin: coinMarket![index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<CoinModel>?> getCoinMarket() async {
    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&sparkline=true';

    setState(() {
      isRefreshing = true;
    });

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    setState(() {
      isRefreshing = false;
    });

    if (response.statusCode == 200) {
      var x = response.body;
      coinMarketList = coinModelFromJson(x);
      print(coinMarketList);
      setState(() {
        coinMarket = coinMarketList;
      });
    } else {
      print(response.statusCode);
    }
  }



Future<List<StockModel>?> getStockMarket() async {
  const url = 'https://real-time-finance-data.p.rapidapi.com/market-trends?trend_type=MOST_ACTIVE';

  setState(() {
    isRefreshing = true;
  });

  var response = await http.get(Uri.parse(url), headers: {
    'X-RapidAPI-Key': '9679f5105dmshaa1fdfdd7d659e9p1d4535jsn227c219dd690',
    'X-RapidAPI-Host': 'real-time-finance-data.p.rapidapi.com'
  });

  setState(() {
    isRefreshing = false;
  });

  if (response.statusCode == 200) {
      var y = response.body;
      stockMarketList = stockModelFromJson(y);
    setState(() {
      stockMarket = stockMarketList;
    });
  } else {
    print(response.statusCode);
  }
}

}
