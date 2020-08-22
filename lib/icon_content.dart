import 'package:flutter/cupertino.dart';

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;
  IconContent(this.text, this.icon);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 18.0, color: Color(0XFF8D8E98)),
        )
      ],
    );
  }
}
