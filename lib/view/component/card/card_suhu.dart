import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/colors/color_libraries.dart';
import '../text/component_big_point.dart';
import '../text/component_textsmall.dart';

class SuhuCard extends StatelessWidget {
  final double suhu;
  final String suhuMessage;
  final String suhuCondition;

  SuhuCard({Key? key, required this.suhu, required this.suhuMessage, required this.suhuCondition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String iconPath;
    Widget textWidget;

    switch (suhuCondition) {
      case "high":
        iconPath = 'assets/icons/alert.svg';
        textWidget = TextDescriptionAlert(suhuMessage);
        break;
      case "good":
        iconPath = 'assets/icons/checklist_icon.svg';
        textWidget = TextDescriptionTiny(suhuMessage);
        break;
      case "low":
        iconPath = 'assets/icons/alert.svg';
        textWidget = TextDescriptionAlert(suhuMessage);
        break;
      default:
        iconPath = 'assets/icons/default_icon.svg';
        textWidget = TextDescriptionTiny(suhuMessage);
    }

    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0x0A000000),
          blurRadius: 50,
          offset: Offset(1, 6),
          spreadRadius: 0,
        ),
      ]),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: ListColor.gray100,
            width: 1,
          ),
        ),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              Row( //row pertama
                children: [
                  TextDescriptionSmall("Suhu Air"),
                  Spacer(),
                  SvgPicture.asset(
                    'assets/icons/arrow_btn.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPointSmall("$suhu"),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        width: 20.w,
                        height: 20.h,
                      ),
                      SizedBox(width: 8.w),
                      textWidget,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
