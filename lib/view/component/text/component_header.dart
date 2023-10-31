import 'package:flutter/material.dart';

class ComponentTextHeader extends StatelessWidget {
  final String? text;

  ComponentTextHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: const TextStyle(
        fontFamily: 'SFDisplay',
        fontSize: 30,
        color: Color(0xff374151),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
