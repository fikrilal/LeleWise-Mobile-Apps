import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/colors/color_libraries.dart';
import '../../page/pakan/pakan_edit.dart';
import '../text/component_big_point.dart';
import '../text/component_textsmall.dart';

Widget buildPakanCard(BuildContext context, Map<String, dynamic> data) {
  String keyNoFilter = data['_key'] ?? "";
  String pengulanganNoFilter = data['pengulangan'] ?? "";
  String waktuPakanNoFilter = data['waktu_pakan'] ?? "";
  String beratPakanNoFilter = data['berat_pakan'] ?? "";

  List<String> timeComponents = waktuPakanNoFilter.split(":");
  int hour = int.parse(timeComponents[0]);
  int minute = int.parse(timeComponents[1]);

  String iconPath;
  String placeholder;
  if (hour >= 5 && hour < 12) {
    iconPath = 'assets/icons/sore.svg';
    placeholder = 'Pagi';
  } else if (hour >= 12 && hour < 15) {
    iconPath = 'assets/icons/pagi.svg';
    placeholder = 'Siang';
  } else if (hour >= 15 && hour < 18) {
    iconPath = 'assets/icons/sore.svg';
    placeholder = 'Sore';
  } else {
    iconPath = 'assets/icons/malam.svg';
    placeholder = 'Malam';
  }

  return Align(
    alignment: Alignment.center,
    child: Container(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        width: 18.w,
                        height: 18.h,
                      ),
                      SizedBox(width: 8.w),
                      TextDescriptionSmallGreen(
                        "$placeholder • $waktuPakanNoFilter",
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(
                              color: ListColor.gray300,
                              width: 1,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPakanPage(data: data),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(2.w, 8.h, 2.w, 8.h),
                          child: TextDescriptionSmallButton("Edit"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPointAccent("$beratPakanNoFilter Gr"),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
