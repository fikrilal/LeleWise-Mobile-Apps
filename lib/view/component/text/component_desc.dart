import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class TextDescriptionPicker extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionPicker(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: this.fontSize,
        color: this.textcolor,
      ),
    );
  }
}

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
        fontSize: SizeDimen.textDescription,
        color: ListColor.gray500,
      ),
    );
  }
}

class TextDescription700 extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescription700(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescription,
        color: ListColor.gray700,
      ),
    );
  }
}

class TextDescriptionBold extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionBold(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        height: 1.5,
        fontSize: SizeDimen.textDescription,
        color: ListColor.gray700,
      ),
    );
  }
}

class TextDescriptionBold24 extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionBold24(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        height: 1.5,
        fontSize: SizeDimen.sizeTextPointAccent,
        color: Colors.white,
      ),
    );
  }
}

class TextDescriptionBoldGreen extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionBoldGreen(this.text,
      {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        height: 1.5,
        fontSize: SizeDimen.textDescription,
        color: ListColor.primary,
      ),
    );
  }
}

class TextDescriptionBoldGreen500 extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionBoldGreen500(this.text,
      {super.key, this.textcolor, this.fontSize});
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
      ),
    );
  }
}
