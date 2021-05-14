import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'roundIconButton.dart';

class ResultContent extends StatelessWidget {
  final String bmiText;
  final String bmiConvertText;
  final Function onPressed;
  final Function onTap;
  ResultContent({@required this.bmiText,@required this.bmiConvertText,@required this.onPressed,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          bmiText,
          style: KLabelStyle,
        ),
        Text(
          bmiConvertText,
          // age.toString(),
          style: KNumberStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton(
              icon: FontAwesomeIcons.minus,
              onPressed: onPressed,
            ),
            RoundIconButton(
              icon: FontAwesomeIcons.plus,
              onPressed: onTap,
            ),
          ],
        ),
      ],
    );
  }
}

