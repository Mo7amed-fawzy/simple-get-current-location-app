import 'package:flutter/material.dart';

Widget customTextWidget(String text) {
  return Text(
    text,
    style: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );
}
