import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class TextPoint extends StatelessWidget {
  final String? text;

  TextPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'Satoshi',
        fontSize: SizeDimen.sizeTextPoint.sp,
        color: ListColor.gray700,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class TextPointSmall extends StatelessWidget {
  final String? text;

  TextPointSmall(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'Satoshi',
        fontSize: SizeDimen.sizeTextPointSmall.sp,
        color: ListColor.gray700,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class TextPointAccent extends StatelessWidget {
  final String? text;

  TextPointAccent(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'Satoshi',
        fontSize: SizeDimen.sizeTextPointAccent.sp,
        color: ListColor.gray700,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}