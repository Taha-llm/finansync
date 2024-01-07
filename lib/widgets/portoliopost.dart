import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hope/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';

class PortfolioPost extends StatelessWidget {
  const PortfolioPost({super.key});

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
            color: buttonsBackground2,
            width: 2.0,
          )),
      child:Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Asset_Name',
                    ),
                    SizedBox(height: 5,),
                    Text('Symbol')
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Qte',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cost',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Current_Value\$',
                    ),
                    SizedBox(height: 5,),
                    Text('Change_%')
                  ],
                ),
                //Expanded(
                //    child: ),
              ],
            ),
          SizedBox(height: 7,),
          Divider(color: Colors.white,),
          Row(
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
        ],
      )
    );
  }
}
