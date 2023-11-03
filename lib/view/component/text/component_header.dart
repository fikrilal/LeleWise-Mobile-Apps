import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
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
        color: ListColor.gray700,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class ComponentTextTitle extends StatelessWidget {
  final String? text;

  ComponentTextTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'Satoshi',
        fontSize: SizeDimen.sizeTextTitle.sp,
        color: ListColor.gray700,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class ComponentTextAppBar extends StatelessWidget {
  final String? text;

  ComponentTextAppBar(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style:  TextStyle(
        fontFamily: 'Satoshi',
        fontSize: SizeDimen.textDescription.sp,
        color: ListColor.gray700,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}