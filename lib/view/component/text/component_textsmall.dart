import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';

class TextDescriptionSmall extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionSmall(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionSmall,
        color: ListColor.gray500,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallW400 extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionSmallW400(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionSmall,
        color: ListColor.gray400,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallGreen extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionSmallGreen(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionSmall,
        color: ListColor.primary,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallTiny extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionSmallTiny(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionTiny,
        color: ListColor.gray500,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallTinyW400 extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionSmallTinyW400(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w400,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionTiny2,
        color: ListColor.gray500,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallTiny400 extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionSmallTiny400(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionTiny,
        color: ListColor.gray400,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallAll extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionSmallAll(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionSmall,
        color: ListColor.primary,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallButton extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionSmallButton(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionSmall,
        color: ListColor.gray600,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallBold extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionSmallBold(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionTiny,
        color: ListColor.red,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallBoldAlert extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionSmallBoldAlert(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        fontSize: SizeDimen.textDescriptionTiny,
        color: ListColor.red,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionSmallBoldGood extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;

  TextDescriptionSmallBoldGood(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w700,
        fontSize: SizeDimen.textDescriptionTiny,
        color: ListColor.primary,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

class TextDescriptionTiny extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionTiny(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(
      "${text}",
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionTiny13,
        color: ListColor.primary,
        overflow: TextOverflow.clip,
      ),
    ),
    );
  }
}

class TextDescriptionAlert extends StatelessWidget {
  final String? text;
  final Color? textcolor;
  final double? fontSize;
  TextDescriptionAlert(this.text, {super.key, this.textcolor, this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(
      "${text}",
      maxLines: 1,
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w500,
        height: 1.5,
        fontSize: SizeDimen.textDescriptionTiny,
        color: ListColor.orange,
        overflow: TextOverflow.clip,
      ),
    ),
    );
  }
}
