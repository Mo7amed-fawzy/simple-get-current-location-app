import 'package:flutter/material.dart';

ButtonStyle customElevatedButtonStyle() {
  return ElevatedButton.styleFrom(
    side: const BorderSide(
      color: Colors.cyan,
      width: 2.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
