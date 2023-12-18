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
      maxLines: 3,
    );
  }
}

class TextDescriptionOver2 extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionOver2(this.text, {super.key, this.textcolor, this.fontSize});
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

class TextDescriptionOverGood extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionOverGood(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescription,
        color: ListColor.primary,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }
}

class TextDescriptionOverAlert extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionOverAlert(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescription,
        color: ListColor.orange,
        overflow: TextOverflow.ellipsis,
      ),
      maxLines: 1,
    );
  }
}