import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class TextLabel extends StatelessWidget {
  final String? text;
  final Color? textcolor;

  TextLabel(this.text, {super.key, this.textcolor});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescription,
        color: ListColor.gray700,
      ),
    );
  }
}
