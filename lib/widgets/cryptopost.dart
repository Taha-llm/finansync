import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class CryptoPost extends StatelessWidget {
  const CryptoPost({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: SizedBox(
              height: 300,
              width: 400,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 15,
                  minY: 15000,
                  maxY: 20000,
                  lineBarsData: [
                    LineChartBarData(spots: [
                      FlSpot(0, 15500),
                      FlSpot(2, 15700),
                      FlSpot(3, 15750),
                      FlSpot(4, 16400),
                      FlSpot(5, 17390),
                      FlSpot(6, 15450),
                      FlSpot(7, 19400),
                      FlSpot(8, 19300),
                      FlSpot(9, 18500),
                      FlSpot(11, 18300),
                      FlSpot(12, 19350),
                      FlSpot(13, 19550),
                      FlSpot(14, 18540),
                      FlSpot(15, 19488),
                    ])
                  ],
                ),
              ),
            ),
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
                      'Crypto_full_Name',
                    ),
                    SizedBox(height: 5,),
                    Text('crypto_Symbol')
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'crypto_Price_\$',
                    ),
                    SizedBox(height: 5,),
                    Text('Change_%')
                  ],
                )),
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
                              content: const Text('Your adding xxx crypto_name to your prtfolio. xxxx amount will be deducted from your account'),
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
}
