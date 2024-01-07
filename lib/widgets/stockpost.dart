import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class StocksPost extends StatelessWidget {
  const StocksPost({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: SizedBox(
              height: 300,
              width: 400,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 15,
                  minY: 0,
                  maxY: 2000,
                  lineBarsData: [
                    LineChartBarData(spots: [
                      FlSpot(0, 500),
                      FlSpot(2, 700),
                      FlSpot(3, 750),
                      FlSpot(4, 400),
                      FlSpot(5, 390),
                      FlSpot(6, 450),
                      FlSpot(7, 400),
                      FlSpot(8, 300),
                      FlSpot(9, 1500),
                      FlSpot(11, 1300),
                      FlSpot(12, 1350),
                      FlSpot(13, 1550),
                      FlSpot(14, 1540),
                      FlSpot(15, 1488),
                    ])
                  ],
                ),
              ),
            ),
          ),
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
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stock_full_Name',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Stock_Symbol')
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Stock_Price_\$',
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Change_%')
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
