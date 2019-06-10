import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

const iconSize = 80.0;
const double sizedBoxHeight = 15;
const double labelSize = 18;
const labelColor = Color(0xFF8D8E98);

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
