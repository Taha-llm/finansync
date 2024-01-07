import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class ExchangePost extends StatelessWidget {
  const ExchangePost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 2.5),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: buttonsBackground2,
          border: Border.all(
            color: buttonsBackground,
            width: 2.0,
          )),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/Flag_of_Europe.svg',
                  width: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Currency',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Value',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'conversion_\$',
                    ),
                    SizedBox(height: 5,),
                    Text('Change_%')
                  ],
                ),
                //Expanded(
                //    child: ),
              ],
            ),
    );
  }
}
