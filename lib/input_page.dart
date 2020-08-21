import 'package:flutter/material.dart';

const Color mainReusableWidgetColor = Color(0XFF1D1E33);
const Color bottomContainerColor = Color(0XFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
                    child: ReusableCard(mainReusableWidgetColor),
                  ),
                  Expanded(
                    child: ReusableCard(mainReusableWidgetColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(mainReusableWidgetColor),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(mainReusableWidgetColor),
                  ),
                  Expanded(
                    child: ReusableCard(mainReusableWidgetColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: bottomContainerColor,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
              ),
            )
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  ReusableCard(this.color, this.cardChild);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
