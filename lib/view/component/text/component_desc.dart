import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class TextDescription extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescription(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize:
            fontSize == null ? SizeDimen.textDescription.sp : fontSize!.sp,
        color: textcolor == null ? ListColor.gray500 : textcolor,
      ),
    );
  }
}