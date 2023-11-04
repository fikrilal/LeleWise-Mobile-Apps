import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';

import '../../component/button/component_primary_btn.dart';
class PakanDashboard extends StatefulWidget {
  static String? routeName = "/PakanDashboard";

  @override
  _PakanDashboardState createState() => _PakanDashboardState();
}

class _PakanDashboardState extends State<PakanDashboard> {
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
              labelStyle: TextStyle(fontWeight: FontWeight.w600, color: ListColor.primary, fontSize: 18),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400, color: ListColor.gray500, fontSize: 18),
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
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: Column(
                            children: [
                              Container(
                                child: Column (
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ComponentTextTitle("Pakan Lele"),
                                    SizedBox(height: 8),
                                    Align( // align kedua
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
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Row( //row pertama
                                                  children: [
                                                    TextDescriptionSmall("Jadwal pakan berikutnya pukul 12.00 AM"),
                                                  ],
                                                ),
                                                const SizedBox(height: 10),
                                                Column( // row kedua
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TextPointSmall("500 Gr"),
                                                    SizedBox(height: 12),
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
                                                          child: Padding(
                                                            padding: EdgeInsets.all(8.0),
                                                            child: TextDescriptionSmallButton("Edit Cepat"),
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
                      height: 8,
                      color: ListColor.gray100,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                          child: Column(
                            children: [
                              Container(
                                child: Column (
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ComponentTextTitle("Jadwal pakan"),
                                    SizedBox(height: 8),
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
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Row( //row pertama
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/pagi.svg',
                                                          width: 18,
                                                          height: 18,
                                                        ),
                                                        SizedBox(width: 8),
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
                                                          child: Padding(
                                                            padding: EdgeInsets.fromLTRB(2, 8, 2, 8),
                                                            child: TextDescriptionSmallButton("Edit"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 2),
                                                Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              children: [
                                                Row( //row pertama
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'assets/icons/sore.svg',
                                                          width: 18,
                                                          height: 18,
                                                        ),
                                                        SizedBox(width: 8),
                                                        TextDescriptionSmallGreen("Sore • 18:00 PM"),
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
                                                          child: Padding(
                                                            padding: EdgeInsets.fromLTRB(2, 8, 2, 8),
                                                            child: TextDescriptionSmallButton("Edit"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 2),
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
                                    const SizedBox(height: 32),
                                    primaryButton(text: "+ Jadwal Baru", onPressed: () async {}),
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
                    Padding(padding: EdgeInsets.fromLTRB(20, 23, 20, 0),
                    child: Column(
                      children: [
                        Align( // align kedua
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
                                horizontalInside: BorderSide(width: 1.0, color: ListColor.gray200),
                                bottom: BorderSide(width: 1.0, color: ListColor.gray200),
                              ),
                              children: [
                                for (var item in dataArray)
                                  TableRow(
                                    children: [
                                      TableCell(
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
                                          child: TextDescription(item["name"] ?? ""),
                                        ),
                                      ),
                                      TableCell(
                                        verticalAlignment: TableCellVerticalAlignment.middle,
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 24.0, top: 24.0),
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
                    ),)
                  ],
                ),
              ),
            ),
          ],
        )
      ),
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