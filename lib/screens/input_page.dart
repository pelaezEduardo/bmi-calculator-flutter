import 'dart:ui';
import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/my_button.dart';
import '../components/bottom_button.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      selectedGender == Gender.male
                          ? kActiveCard
                          : kInactiveCard,
                      IconContent(FontAwesomeIcons.mars, 'MALE'), () {
                    setState(
                      () {
                        selectedGender = Gender.male;
                      },
                    );
                  }),
                ),
                Expanded(
                  child: ReusableCard(
                      selectedGender == Gender.female
                          ? kActiveCard
                          : kInactiveCard,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE'), () {
                    setState(
                      () {
                        selectedGender = Gender.female;
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveCard,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kNumberStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kBottomContainer,
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.grey.shade600,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              () {},
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    kActiveCard,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              '$weight',
                              style: kNumberStyle,
                            ),
                            Text(
                              'KG',
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                weight--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                weight++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kActiveCard,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$age',
                          style: kNumberStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyButton(FontAwesomeIcons.minus, () {
                              setState(() {
                                age--;
                              });
                            }),
                            SizedBox(
                              width: 10.0,
                            ),
                            MyButton(FontAwesomeIcons.plus, () {
                              setState(() {
                                age++;
                              });
                            }),
                          ],
                        ),
                      ],
                    ),
                    () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Calculator calculator =
                  Calculator(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculator.calculateBMI(),
                    resultText: calculator.getResult(),
                    interpretation: calculator.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
