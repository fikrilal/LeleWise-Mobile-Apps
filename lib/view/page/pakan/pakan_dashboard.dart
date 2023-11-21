import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_new_schedule.dart';

import '../../component/button/component_primary_btn.dart';

class PakanDashboard extends StatefulWidget {
  static String? routeName = "/PakanDashboard";

  @override
  _PakanDashboardState createState() => _PakanDashboardState();
}

class _PakanDashboardState extends State<PakanDashboard> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(10.0),
              child: TabBar(
                labelColor: ListColor.primary,
                unselectedLabelColor: ListColor.gray400,
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ListColor.primary,
                    fontSize: 18),
                unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: ListColor.gray500,
                    fontSize: 18),
                indicatorColor: ListColor.primary,
                tabs: [
                  Tab(
                    child: Text("Pakan"),
                  ),
                  Tab(
                    child: Text("Riwayat"),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ComponentTextTitle("Pakan Lele"),
                                      SizedBox(height: 8.h),
                                      Align(
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
                                                      TextDescriptionSmall("Jadwal pakan berikutnya pukul 12.00 AM"),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      TextPointSmall("500 Gr"),
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
                                                              const Divider(
                                                                thickness: 0.7
                                                              ),
                                                              SizedBox(height: 24.h),
                                                              Row(
                                                                children: [
                                                                  TextDescription("Berat Pakan"),
                                                                  Spacer(),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: [
                                                                      TextDescriptionBoldGreen("omg"),
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
                                                              SizedBox(height: 20.h),
                                                              const Divider(
                                                                  thickness: 0.7
                                                              ),
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
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: double.infinity,
                        height: 8.h,
                        color: ListColor.gray100,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ComponentTextTitle("Jadwal pakan"),
                                      SizedBox(height: 8.h),
                                      Align(
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
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/pagi.svg',
                                                            width: 18.w,
                                                            height: 18.h,
                                                          ),
                                                          SizedBox(width: 8.w),
                                                          TextDescriptionSmallGreen("Pagi • 07:00 AM"),
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
                                                              // Tindakan yang akan dijalankan ketika tombol ditekan
                                                            },
                                                            child: Padding(padding: EdgeInsets.fromLTRB(2.w, 8.h, 2.w, 8.h),
                                                              child: TextDescriptionSmallButton("Edit"),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 2.h),
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      TextPointAccent("500 Gr"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SvgPicture.asset(
                                                            'assets/icons/sore.svg',
                                                            width: 18.w,
                                                            height: 18.h,
                                                          ),
                                                          SizedBox(width: 8.w),
                                                          TextDescriptionSmallGreen(
                                                              "Sore • 18:00 PM"),
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Row(
                                                        children: [
                                                          ElevatedButton(
                                                            style:
                                                                ElevatedButton.styleFrom(
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
                                                              // Tindakan yang akan dijalankan ketika tombol ditekan
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(2.w, 8.h, 2.w, 8.h),
                                                              child:
                                                                  TextDescriptionSmallButton("Edit"),
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
                                                      TextPointAccent("350 Gr"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 32.h),
                                      primaryButton(
                                          text: "+ Jadwal Baru",
                                          onPressed: () async {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      NewSchedulePage()),
                                            );
                                          }),
                                    ],
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
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 23.h, 20.w, 0.h),
                        child: Column(
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
                                child: Table(
                                  border: const TableBorder(
                                    horizontalInside: BorderSide(
                                        width: 1.0, color: ListColor.gray200),
                                    bottom: BorderSide(
                                        width: 1.0, color: ListColor.gray200),
                                  ),
                                  children: [
                                    for (var item in dataArray)
                                      TableRow(
                                        children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  bottom: 24.h, top: 24.h),
                                              child: TextDescription(
                                                  item["name"] ?? ""),
                                            ),
                                          ),
                                          TableCell(
                                            verticalAlignment:
                                                TableCellVerticalAlignment.middle,
                                            child: Padding(
                                              padding: EdgeInsets.only(bottom: 24.h, top: 24.h),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: TextDescription(
                                                    item["date"] ?? ""),
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
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

List<Map<String, String>> dataArray = [
  {"name": "500 Gr", "date": "Selasa 17 Oct • 07:30"},
  {"name": "500 Gr", "date": "Rabu 18 Oct • 03:30"},
  {"name": "500 Gr", "date": "Rabu 18 Oct • 12:30"},
  {"name": "500 Gr", "date": "Rabu 18 Oct • 08:30"},
  {"name": "500 Gr", "date": "Selasa 17 Oct • 07:30"},
  {"name": "500 Gr", "date": "Rabu 18 Oct • 08:30"},
  // ...Tambahkan data lainnya ke dalam array
];
