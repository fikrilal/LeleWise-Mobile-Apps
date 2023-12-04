import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../text/component_textsmall.dart';
// Import widget dan resources yang diperlukan

class PHCard extends StatelessWidget {
  final double ph;
  final String phMessage;
  final String phCondition;

  PHCard({Key? key, required this.ph, required this.phMessage, required this.phCondition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String iconPath;
    Widget textWidget;

    switch (phCondition) {
      case "high":
        iconPath = 'assets/icons/alert_icon.svg';
        textWidget = TextDescriptionAlert(phMessage);
        break;
      case "good":
        iconPath = 'assets/icons/cheklist_icon.svg';
        textWidget = TextDescriptionTiny(phMessage);
        break;
      case "low":
        iconPath = 'assets/icons/alert_icon.svg';
        textWidget = TextDescriptionAlert(phMessage);
        break;
      default:
        iconPath = 'assets/icons/default_icon.svg';
        textWidget = TextDescriptionTiny(phMessage);
    }

    return Container(
      // ... kode Container dan Card seperti sebelumnya
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // ... isi card
          ],
        ),
      ),
    );
  }
}
