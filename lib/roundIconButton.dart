import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundIconButton({@required this.icon,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 8.0,
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints(
        minWidth: 56.0, minHeight: 56.0,
      ),
      child: Icon(icon),
      
    );
  }
}