import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class TextDescription extends StatelessWidget {
  final String? text;
  final Color? textcolor;

  TextDescription(this.text, {super.key, this.textcolor});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w400,

        height: 1.5,
        fontSize: SizeDimen.textDescription.sp,
        color: Color(0xff6B7280),
      ),
    );
  }
}
