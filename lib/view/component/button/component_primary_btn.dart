import 'package:flutter/material.dart';

import '../../../res/colors/color_libraries.dart';

Widget primaryButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff0A9830),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      minimumSize: Size(double.infinity, 0),
      padding: const EdgeInsets.symmetric(
          vertical: 16),
      elevation: 0,
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget secondaryButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(
          color: ListColor.gray300,
          width: 1,
        ),
      ),
      minimumSize: Size(double.infinity, 0),
      padding: const EdgeInsets.symmetric(
          vertical: 12),
      elevation: 0,
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: ListColor.gray700,
        fontSize: 16,
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}