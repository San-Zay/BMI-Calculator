import 'package:flutter/material.dart';

import 'constants.dart';

class CalculateBotton extends StatelessWidget {
  final String butonTitle;
  final Function onTap;
  CalculateBotton({@required this.butonTitle,@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 10.0),
        height: 80.0,
        color: KBottomColor,
        child: Center(
          child: Text(
            butonTitle,
            style: KButtonStyle,
          ),
        ),
      ),
    );
  }
}
