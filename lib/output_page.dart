import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class OutputPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretationText;

  OutputPage(
      {@required this.bmiResult,
      @required this.interpretationText,
      @required this.resultText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Text(
              'Your Result',
              style: kDataTextStyle,
            ),
          ),
          Expanded(
              flex: 25,
              child: ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.greenAccent,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: kDataTextStyle.copyWith(fontSize: 100.0),
                    ),
                    Text(
                      interpretationText,
                      style: kLabelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              )),
          Expanded(
            flex: 6,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
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
      ),
    );
  }
}
