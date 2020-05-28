import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainer = Color(0xFFEB1555);
const activeCard = Color(0xFF1D1E33);
const inactiveCard = Color(0xFF111328);
const bottomContainerHeigth = 80.0;

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGener;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGener = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      selectedGener == Gender.male ? activeCard : inactiveCard,
                      IconContent(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGener = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      selectedGener == Gender.female
                          ? activeCard
                          : inactiveCard,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(activeCard, Column()),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(activeCard, Column()),
                ),
                Expanded(
                  child: ReusableCard(activeCard, Column()),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainer,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeigth,
          ),
        ],
      ),
    );
  }
}
