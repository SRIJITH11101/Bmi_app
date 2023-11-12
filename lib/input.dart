import 'package:bmi/calculate.dart';
import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'package:bmi/card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/constant.dart';
import 'dart:ui';
import 'package:bmi/result.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color mcolor = inactivecolor;
  Color fcolor = inactivecolor;
  int height = 180;
  int weight = 60;
  int age = 12;

  void gender(int n) {
    if (n == 1) {
      if (mcolor == inactivecolor) {
        mcolor = activecolor;
        fcolor = inactivecolor;
      } else
        mcolor = inactivecolor;
    } else {
      if (fcolor == inactivecolor) {
        fcolor = activecolor;
        mcolor = inactivecolor;
      } else
        fcolor = inactivecolor;
    }
  }

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender(1);
                        });
                      },
                      child: reusecard(
                        cardchild: cardcontent(
                          ic: FontAwesomeIcons.mars,
                          name: 'MALE',
                        ),
                        color: mcolor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          gender(0);
                        });
                      },
                      child: reusecard(
                        cardchild: cardcontent(
                          ic: FontAwesomeIcons.venus,
                          name: "FEMALE",
                        ),
                        color: fcolor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: reusecard(
                color: cardcolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT', style: tStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: nStyle),
                        Text('cm', style: tStyle),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double nv) {
                        setState(() {
                          height = nv.round();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: reusecard(
                      color: cardcolor,
                      cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("WEIGHT", style: tStyle),
                            Text(weight.toString(), style: nStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(FontAwesomeIcons.minus,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        weight = weight - 1;
                                      });
                                    }),
                                SizedBox(width: 10),
                                FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(FontAwesomeIcons.plus,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        weight = weight + 1;
                                      });
                                    }),
                              ],
                            )
                          ]),
                    ),
                  ),
                  Expanded(
                    child: reusecard(
                      color: cardcolor,
                      cardchild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("AGE", style: tStyle),
                            Text(age.toString(), style: nStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(FontAwesomeIcons.minus,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        age = age - 1;
                                      });
                                    }),
                                SizedBox(width: 10),
                                FloatingActionButton(
                                    backgroundColor: Color(0xFF4C4F5E),
                                    child: Icon(FontAwesomeIcons.plus,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        age = age + 1;
                                      });
                                    }),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Resultcalculate calc =
                    Resultcalculate(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResulPage(
                          intrepretate: calc.CalcBMI(),
                          bmiresults: calc.GetResults(),
                          resultText: calc.interpString());
                    },
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calculate',
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

class cardcontent extends StatelessWidget {
  const cardcontent({super.key, required this.ic, required this.name});
  final IconData ic;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          ic,
          size: 100,
          color: Colors.white38,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: tStyle,
        )
      ],
    );
  }
}


// Container(
//           decoration: BoxDecoration(
//               color: Color.fromARGB(155, 39, 3, 63),
//               borderRadius: BorderRadius.circular(15.0)),
//           margin: EdgeInsets.all(17),
//           height: 200,
//           width: 170,
//         )s