import 'package:flutter/material.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: InputPage(),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0XFF0A0E21),
          primaryColor: Color(0XFF0A0E21),
        ));
  }
}
