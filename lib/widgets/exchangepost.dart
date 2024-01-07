import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class ExchangePost extends StatelessWidget {
  final double amount;
  final double value;
  final String symbol;
  final String flag;

  const ExchangePost({
    Key? key,
    required this.amount,
    required this.value,
    required this.symbol,
    required this.flag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: buttonsBackground2,
        border: Border.all(
          color: buttonsBackground,
          width: 2.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            'https://api.exchangerate-api.com/flag-images/$flag.gif',
            height : 40
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$symbol',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${(amount * value).toStringAsFixed(2)}'+' $symbol',
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '$amount' + ' TND',
              ),
              SizedBox(height: 5),
            ],
          ),
        ],
      ),
    );
  }
}
