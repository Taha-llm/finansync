// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hope/Model/coinModel.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Model/chartModel.dart';
import 'package:hope/View/selectCoin.dart';
import 'package:intl/intl.dart'; // For DateFormat
import 'package:syncfusion_flutter_charts/charts.dart'; // For SfCartesianChart

class CryptoPost extends StatefulWidget {
  final CoinModel coin; // Add the parameter

  const CryptoPost({Key? key, required this.coin}) : super(key: key);
  @override
  State<CryptoPost> createState() => _CryptoPostState();
}

class _CryptoPostState extends State<CryptoPost> {
  late CoinModel coin;
  late TrackballBehavior trackballBehavior;

  @override
  void initState() {
    getChart();
    trackballBehavior = TrackballBehavior(
    enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
    coin = widget.coin;

  
  }
  
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: buttonsBackground2,
          border: Border.all(
            color: buttonsBackground,
            width: 2.0,
          )),
      child: Column(
        children: [
          Container(
                  height: myHeight * 0.4,
                  width: myWidth,
                  // color: Colors.amber,
                  child: isRefresh == true
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffFBC700),
                          ),
                        )
                      : itemChart == null
                          ? Padding(
                              padding: EdgeInsets.all(myHeight * 0.06),
                              child: Center(
                                child: Text(
                                  'Attention this Api is free, so you cannot send multiple requests per second, please wait and try again later.',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            )
                          : SfCartesianChart(
  trackballBehavior: trackballBehavior,
  zoomPanBehavior: ZoomPanBehavior(
    enablePinching: true,
    zoomMode: ZoomMode.x,
  ),
  primaryXAxis: DateTimeAxis(
    dateFormat: DateFormat('yyyy/MM/dd'), // Format as year/month/day
  ),
  series: <CandleSeries>[
    CandleSeries<ChartModel, DateTime>(
      enableSolidCandles: true,
      enableTooltip: true,
      bullColor: Colors.green,
      bearColor: Colors.red,
      dataSource: itemChart!,
      xValueMapper: (ChartModel sales, _) =>
          DateTime.fromMillisecondsSinceEpoch(sales.time),
      lowValueMapper: (ChartModel sales, _) => sales.low,
      highValueMapper: (ChartModel sales, _) => sales.high,
      openValueMapper: (ChartModel sales, _) => sales.open,
      closeValueMapper: (ChartModel sales, _) => sales.close,
      animationDuration: 55,
    ),
  ],
)

,
                ),
          SizedBox(
            height: 15,
          ),
          Divider(color: Colors.white,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Image.network(
                      coin.image),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coin.name,
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(coin!.symbol)
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        coin.currentPrice.toString()+"\$", // Ajoute un signe de dollar
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        coin.priceChangePercentage24H.toString() + "%", // Ajoute un signe de pourcentage
                        style: TextStyle(
                          // Ajoutez ici d'autres styles de texte si nécessaire
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 32,
                )
              ],
            ),
          ),
          Divider(color: Colors.white,),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(100, 45),
                    foregroundColor: Colors.green,
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: buttonsBackground,
                  ),
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
                                    onPressed: () {},
                                    child: const Text('Confirm'))
                              ],
                              title:const Text('Are you sure'),
                              content: const Text('Your adding xxx coin_name to your prtfolio. xxxx amount will be deducted from your account'),
                            ));
                  },
                  child: const Text('Buy'),
                ),
                SizedBox(width: 5,),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(100, 45),
                    foregroundColor: Colors.red,
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: buttonsBackground,
                  ),
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
                                    onPressed: () {},
                                    child: const Text('Confirm'))
                              ],
                              title:const Text('Are you sure'),
                              content: const Text('Your removing xxx crypto_name from your prtfolio. xxxx amount will be added to your account'),
                            ));
                  },
                  child: const Text('Sell'),
                ),
                SizedBox(width: 15,),
                Expanded(child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.pink[300],
                    )
                  )
                ),
                SizedBox(width: 15,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> text = ['D', 'W', 'M', '3M', '6M', 'Y'];
  List<bool> textBool = [false, false, true, false, false, false];

  int days = 30;

  setDays(String txt) {
    if (txt == 'D') {
      setState(() {
        days = 1;
      });
    } else if (txt == 'W') {
      setState(() {
        days = 7;
      });
    } else if (txt == 'M') {
      setState(() {
        days = 30;
      });
    } else if (txt == '3M') {
      setState(() {
        days = 90;
      });
    } else if (txt == '6M') {
      setState(() {
        days = 180;
      });
    } else if (txt == 'Y') {
      setState(() {
        days = 365;
      });
    }
  }

  List<ChartModel>? itemChart;

  bool isRefresh = true;

  Future<void> getChart() async {
    String url = 'https://api.coingecko.com/api/v3/coins/' +
        widget.coin.id +
        '/ohlc?vs_currency=usd&days=' +
        "7";

    setState(() {
      isRefresh = true;
    });

    var response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });

    setState(() {
      isRefresh = false;
    });
    if (response.statusCode == 200) {
      Iterable x = json.decode(response.body);
      print(x);
      List<ChartModel> modelList =
          x.map((e) => ChartModel.fromJson(e)).toList();
      setState(() {
        itemChart = modelList;
      });
    } else {
      print(response.statusCode);
    }
  }

  
}
