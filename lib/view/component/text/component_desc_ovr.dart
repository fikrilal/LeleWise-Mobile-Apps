import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class TextDescriptionOver extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionOver(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescription,
        color: ListColor.gray600,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TextDescriptionCut extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionCut(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        height: 1.5,
        fontSize: SizeDimen.sizeTextAppBar,
        color: ListColor.gray700,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 3,
    );
  }
}