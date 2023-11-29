import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/colors/color_libraries.dart';
import '../radio_button/radio_button.dart';
import '../text/component_big_point.dart';
import '../text/component_desc.dart';
import '../text/component_textsmall.dart';

Widget buildPakanCard(Map<String, dynamic> data) {
  String waktuPakanNoFilter = data['waktu_pakan'] ?? "";
  String beratPakanNoFilter = data['berat_pakan'] ?? "";
  return Align(
    alignment: Alignment.center,
    child: Container(
      decoration:
      const BoxDecoration(boxShadow: [
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
          borderRadius:
          BorderRadius.circular(10),
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
                children: [
                  TextDescriptionSmall("Jadwal pakan berikutnya pukul $_nextFeedingTime AM"),
                ],
              ),
              SizedBox(height: 10.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextPointSmall("$_beratPakan Gr"),
                  SizedBox(height: 10.h),
                  AnimatedContainer(
                    height: _isExpanded == true ? 100.h : 0,
                    duration: const Duration(milliseconds: 300),
                    child: AnimatedOpacity(
                      opacity: _isExpanded == true ? 1.0 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // const Divider(
                          //   thickness: 0.7
                          // ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                  builder: ((context) {
                                    return IntrinsicHeight(
                                      child: Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 32.h),
                                            for (var option2 in options2)
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectedOption2 = option2;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(24.w),
                                                  decoration: BoxDecoration(
                                                    color: option2.id == selectedOption2.id ? ListColor.primaryAccent : Colors.transparent,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        option2.name,
                                                        style: TextStyle(
                                                          fontFamily: 'Satoshi',
                                                          fontWeight: option2.name == selectedOption2.name ? FontWeight.w700 : FontWeight.w500,
                                                          height: 1.5,
                                                          fontSize: 18,
                                                          color: option2.name == selectedOption2.name ? ListColor.primary : ListColor.gray600,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      CustomRadio(
                                                        value: option2.id,
                                                        groupValue: selectedOption2.id,
                                                        onChanged: (int? value) {
                                                          setState(() {
                                                            selectedOption2 = options2.firstWhere((opt) => opt.id == value);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(width: 1, color: ListColor.gray200),
                                  top: BorderSide(width: 1, color: ListColor.gray200),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 24.h, 0, 24.h),
                                child: Row(
                                  children: [
                                    TextDescription("Berat Pakan"),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        TextDescriptionBoldGreen("${selectedOption2.name}"),
                                        SizedBox(width: 8.w),
                                        SvgPicture.asset(
                                          'assets/icons/right_arrow2.svg',
                                          width: 20.w,
                                          height: 20.h,
                                          color: ListColor.gray500,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // const Divider(
                          //     thickness: 0.7
                          // ),
                        ],
                      ),
                    ),
                  ),
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
                          // KETIKA TOMBOL DITEKAN, AKAN MENG-EXPAND CARD ATAU CONTAINER
                          if (_isExpanded) {
                            setState(() {
                              _isExpanded = false;
                            });
                          } else {
                            setState(() {
                              _isExpanded = true;
                            });
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: TextDescriptionSmallButton(
                              _isExpanded == true ? "Simpan" : "Edit Cepat"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}