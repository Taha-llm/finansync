import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hope/Model/stockModel.dart';
import 'package:hope/Model/coinModel.dart';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_charts/charts.dart';
import '../Model/chartModel.dart';
import 'package:hope/View/selectCoin.dart';



class StocksPost extends StatefulWidget {
  final StockModel stock; // Add the parameter
  final CoinModel coin;
  const StocksPost({Key? key, required this.stock,required this.coin}) : super(key: key);
  @override
  State<StocksPost> createState() => _StocksPostState();
}

class _StocksPostState extends State<StocksPost> {
  late StockModel stock;
  late CoinModel coin;

  @override
  void initState() {
    super.initState();
    stock = widget.stock;
    coin = widget.coin;

  
  }
  
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
  child: Column(
    children: [
      Expanded(
        child: Sparkline(
          data: coin.sparklineIn7D.price,
          lineWidth: 2.0,
          lineColor: stock.changePercent >= 0 ? Colors.green : Colors.red,          

        ),
      ),
      SizedBox(height: 8.0), // Spacer
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('Previous_close', style: TextStyle(color: gold)),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('${stock.previous_close}'),
        ],
      ),
    ],
  ),
)
,
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16)
                .copyWith(right: 0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                      'assets/FinanSync-logos_transparent.svg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(stock.symbol,
                    style: TextStyle(
                        fontSize: 12, 
                      ),)
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                       stock.price.toString()+"\$",
                       style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold, 
                      ),

                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(stock.changePercent.toString()+ "%")
                    
                  ],
                )),
                SizedBox(
                  width: 32,
                )
              ],
            ),
          ),
          Divider(
            color: Colors.white,
          ),
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
                              title: const Text('Are you sure'),
                              content: const Text(
                                  'You are adding this stock to your portfolio. xxx ammount will be deducted from you account.'),
                            ));
                  },
                  child: const Text('Buy'),
                ),
                SizedBox(
                  width: 5,
                ),
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
                              title: const Text('Are you sure'),
                              content: const Text(
                                  'Your removing this stock from your prtfolio. xxxx amount will be added to your account'),
                            ));
                  },
                  child: const Text('Sell'),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.pink[300],
                        ))),
                SizedBox(
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
