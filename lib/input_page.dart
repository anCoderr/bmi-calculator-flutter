import 'package:bmi_calculator/bmi_calculator_brain.dart';
import 'package:bmi_calculator/output_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  GenderType selectedGender;

  int heightOfUser = 175;
  int weightOfUser = 60;
  int ageOfUser = 30;

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
              flex: kReusableCardFlex,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.male;
                          });
                        },
                        color: (selectedGender == GenderType.male)
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent('MALE', FontAwesomeIcons.mars)),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        },
                        color: (selectedGender == GenderType.female)
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild:
                            IconContent('FEMALE', FontAwesomeIcons.venus)),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: kReusableCardFlex,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          heightOfUser.toInt().toString(),
                          style: kDataTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0XFF8D8E98),
                          thumbColor: Color(0XFFEB1555),
                          overlayColor: Color(0X29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 10.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25.0)),
                      child: Slider(
                        value: heightOfUser.toDouble(),
                        max: 250,
                        min: 100,
                        divisions: 150,
                        onChanged: (double newValue) {
                          setState(() {
                            heightOfUser = newValue.toInt();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: kReusableCardFlex,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                weightOfUser.toString(),
                                style: kDataTextStyle,
                              ),
                              Text(
                                ' Kg',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                displayIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weightOfUser = subtractor(weightOfUser);
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                displayIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weightOfUser = adder(weightOfUser);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: <Widget>[
                              Text(
                                ageOfUser.toString(),
                                style: kDataTextStyle,
                              ),
                              Text(
                                ' Yrs.',
                                style: kLabelTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                displayIcon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    ageOfUser = subtractor(ageOfUser);
                                  });
                                },
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              RoundIconButton(
                                displayIcon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    ageOfUser = adder(ageOfUser);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: GestureDetector(
                onTap: () {
                  BmiCalculatorBrain brain = BmiCalculatorBrain(
                      height: heightOfUser, weight: weightOfUser);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OutputPage(
                                bmiResult: brain.getBmi(),
                                resultText: brain.getResult(),
                                interpretationText: brain.getInterpretation(),
                              )));
                },
                child: Container(
                  child: Center(
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  color: kBottomContainerColor,
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                ),
              ),
            ),
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData displayIcon;
  final Function onPressed;

  RoundIconButton({
    this.displayIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(
        displayIcon,
      ),
      constraints: BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}

int adder(int number) {
  return number + 1;
}

int subtractor(int number) {
  return number - 1;
}
