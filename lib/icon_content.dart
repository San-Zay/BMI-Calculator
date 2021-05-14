import 'package:flutter/material.dart';

import 'constants.dart';



class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  IconContent({@required this.icon,this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(icon,size: KIconSize,),
        Text(label,style: KLabelStyle,),
      ],
    );
  }
}