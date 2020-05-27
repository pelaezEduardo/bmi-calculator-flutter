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
  Color maleCardColor = inactiveCard;
  Color femaleCardColor = inactiveCard;

  void updateColor(Gender gender) {
    (gender == Gender.male) ? {
      if (maleCardColor == inactiveCard) {
        maleCardColor = activeCard;
        femaleCardColor = inactiveCard;
      }
    } : {
      if (femaleCardColor == inactiveCard) {
        femaleCardColor = activeCard;
        maleCardColor = inactiveCard;
      }
    }
  }

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
                        updateColor(Gender.male);
                      });
                    },
                    child: ReusableCard(
                      maleCardColor,
                      IconContent(FontAwesomeIcons.mars, 'MALE'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      femaleCardColor,
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
