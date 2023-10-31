import 'package:flutter/material.dart';

class TextDescription extends StatelessWidget {
  final String? text;
  final Color? textcolor;

  TextDescription(this.text, {super.key, this.textcolor});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: const TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontSize: 18,
        color: Color(0xff6B7280),
      ),
    );
  }
}
