import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class ComponentTextHeader extends StatelessWidget {
  final String? text;

  ComponentTextHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'SFDisplay',
        fontSize: SizeDimen.sizeTextHeader.sp,
        color: Color(0xff374151),
        fontWeight: FontWeight.w800,
      ),
    );
  }
}
