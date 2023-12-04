import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/colors/color_libraries.dart';
import '../text/component_big_point.dart';
import '../text/component_textsmall.dart';

class PHCard extends StatelessWidget {
  final double ph;
  final String phMessage;
  final String phCondition;

  PHCard({Key? key, required this.ph, required this.phMessage, required this.phCondition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String iconPath;
    Widget textWidget;

    switch (phCondition) {
      case "high":
        iconPath = 'assets/icons/alert.svg';
        textWidget = TextDescriptionAlert(phMessage);
        break;
      case "good":
        iconPath = 'assets/icons/cheklist_icon.svg';
        textWidget = TextDescriptionTiny(phMessage);
        break;
      case "low":
        iconPath = 'assets/icons/alert.svg';
        textWidget = TextDescriptionAlert(phMessage);
        break;
      default:
        iconPath = 'assets/icons/cheklist_icon.svg';
        textWidget = TextDescriptionTiny(phMessage);
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
                  TextDescriptionSmall("pH Air"),
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
                  TextPointSmall("$ph"),
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
