import 'package:flutter/material.dart';

Widget customTextWidget(String text,
    {Color color = Colors.black,
    double fontsize = 24,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(fontSize: fontsize, fontWeight: fontWeight, color: color),
  );
}
