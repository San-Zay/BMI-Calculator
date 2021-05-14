// import 'package:bmi_calculator/calculate_bottom.dart';
import 'package:bmi_calculator/calculate_bottom.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:bmi_calculator/reusable_card.dart';

class Resultpage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  Resultpage({@required this.bmiResult,@required this.resultText,@required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCUATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: KActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    resultText,
                    style: KResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: BMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: KBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CalculateBotton(
              butonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
