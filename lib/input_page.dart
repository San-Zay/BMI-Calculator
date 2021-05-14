import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calclator_brain.dart';

import 'calculate_bottom.dart';
import 'constants.dart';
import 'result_content.dart';

enum Gender {
  male,
  female,
}

class Inputpage extends StatefulWidget {
  @override
  _InputpageState createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Color maleColor = KInactiveCardColor;
  Color femaleColor = KInactiveCardColor;
  Gender selectGender;
  int height = 180;
  int weight = 74;
  int age = 18;

  // void updateColor(Gender selectGender) {

  //   selectGender==Gender.male?maleColor=activeCardColor:maleColor=inactiveCardColor;
  //   selectGender==Gender.female?femaleColor=activeCardColor:femaleColor=inactiveCardColor;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    colour: selectGender == Gender.male
                        ? maleColor = KActiveCardColor
                        : maleColor = KInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    colour: selectGender == Gender.female
                        ? femaleColor = KActiveCardColor
                        : femaleColor = KInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: KLabelStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: KNumberStyle,
                            ),
                            // SizedBox(width: 10.0,),
                            Text(
                              'cm',
                              style: KLabelStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            inactiveTickMarkColor: Colors.grey,
                            overlayColor: Color(0x52EB1555),
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.toInt();
                                });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColor,
                    cardChild: ResultContent(
                      bmiText: 'WEIGHT',
                      bmiConvertText: weight.toString(),
                      onPressed: (){
                        setState(() {
                          weight--;
                        });
                      },
                      onTap: (){
                        setState(() {
                          weight++;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: KActiveCardColor,
                    cardChild: ResultContent(
                      bmiText: 'AGE',
                      bmiConvertText: age.toString(),
                      onPressed: (){
                        setState(() {
                          age--;
                        });
                      },
                      onTap: (){
                        setState(() {
                          age++;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateBotton(
          butonTitle: 'CALCULATE', 
          onTap: (){
            CalculatorBrain calc=CalculatorBrain(height: height,weight: weight);
            
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Resultpage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          })
        ],
      ),
    );
  }
}


