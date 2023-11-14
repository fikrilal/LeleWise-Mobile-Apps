import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';

import '../../component/text/component_desc_ovr.dart';

class SuhuAirPage extends StatefulWidget {
  static String? routeName = "/TemplatePage";
  @override
  _SuhuAirPageState createState() => _SuhuAirPageState();
}

class _SuhuAirPageState extends State<SuhuAirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(16.w, 46.h, 16.w, 20.h),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
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
                            Row( //row pertama
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/water.svg',
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                SizedBox(width: 8.w),
                                TextDescriptionOver("Suhu air hari ini")
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Row(
                              children: [
                                TextPoint("32°C"),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:[
                                    TextDescriptionSmall("Kemarin: 31°C"),
                                    TextDescriptionSmall("Rata-rata: 33°C")
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/cheklist_icon.svg',
                                  width: 20.w,
                                  height: 20.h,
                                ),
                                SizedBox(width: 8.w),
                                TextDescriptionTiny("Dalam keadaan baik")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Column(
                  children: [
                    Container(
                      child: Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ComponentTextTitle("Riwayat Suhu Air"),
                          SizedBox(height: 10.h),
                          Align( // align kedua
                            alignment: Alignment.center,
                            child: Container(
                              child: Table(
                                border: const TableBorder(
                                  horizontalInside: BorderSide(width: 1.0, color: ListColor.gray200),
                                  bottom: BorderSide(width: 1.0, color: ListColor.gray200),
                                ),
                                children: [
                                  for (var item in dataArray)
                                    TableRow(
                                      children: [
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 24.h, top: 24.h),
                                            child: TextDescription(item["name"] ?? ""),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment: TableCellVerticalAlignment.middle,
                                          child: Padding(
                                            padding: EdgeInsets.only(bottom: 24.h, top: 24.h),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: TextDescription(item["date"] ?? ""),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}

List<Map<String, String>> dataArray = [
  {"name": "33°C", "date": "Selasa 17 Oct"},
  {"name": "33°C", "date": "Rabu 18 Oct"},
  {"name": "33°C", "date": "Selasa 17 Oct"},
  {"name": "33°C", "date": "Rabu 18 Oct"},
  {"name": "33°C", "date": "Selasa 17 Oct"},
  {"name": "33°C", "date": "Rabu 18 Oct"},
  {"name": "33°C", "date": "Selasa 17 Oct"},
  {"name": "33°C", "date": "Rabu 18 Oct"},

  // ...Tambahkan data lainnya ke dalam array
];