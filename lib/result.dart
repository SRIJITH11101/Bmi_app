import 'package:bmi/card.dart';
import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';

class ResulPage extends StatelessWidget {
  //const ResulPage({super.key});
  ResulPage(
      {required this.intrepretate,
      required this.bmiresults,
      required this.resultText});
  final String intrepretate;
  final String bmiresults;
  final String resultText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'BMI CALCULATOR',
              style: TextStyle(color: Colors.white),
            ),
          ),
          backgroundColor: Color.fromARGB(210, 9, 1, 14),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Text(
                "Your Results",
                style: nStyle,
              ),
            ),
            Expanded(
                flex: 5,
                child: reusecard(
                    cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: resulttext,
                    ),
                    Text(
                      bmiresults,
                      style: bmitext,
                    ),
                    Text(
                      intrepretate,
                      style: bodytext,
                    )
                  ],
                ))),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Re-Calculate',
                    style: Largetextstyle,
                  ),
                ),
                color: Colors.pinkAccent,
                width: double.infinity,
                height: 50,
              ),
            )
          ],
        ));
  }
}
