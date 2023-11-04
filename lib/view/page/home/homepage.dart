import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc_ovr.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: ListColor.gray300,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ai_icon.svg',
                                    width: 28,
                                    height: 28,
                                  ),
                                  SizedBox(width: 16),
                                  TextDescriptionOver("Lele kamu dalam keadaan baik!")
                                ],
                              ),
                            ),
                          ),
                        ),
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
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/maps_icon.svg',
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        TextDescriptionOver("Mojoroto, Kediri")
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    Row( // row kedua
                                      children: [
                                        TextPoint("32°C"),
                                        SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            TextDescriptionSmall("Kemarin: 31°C"),
                                            TextDescriptionSmall("Rata-rata: 33°C")
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
                        Row(
                          children: [
                            Expanded(child:
                            Align( // align pertama
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
                                            TextDescriptionSmall("pH Air"),
                                            Spacer(),
                                            SvgPicture.asset(
                                              'assets/icons/arrow_btn.svg',
                                              width: 26,
                                              height: 26,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Column( // row kedua
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextPointSmall("5,45"),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/cheklist_icon.svg',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                const SizedBox(width: 8),
                                                TextDescriptionTiny("Kondisi baik")
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
                            ),
                            Expanded(child:
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
                                            TextDescriptionSmall("Suhu air"),
                                            Spacer(),
                                            SvgPicture.asset(
                                              'assets/icons/arrow_btn.svg',
                                              width: 26,
                                              height: 26,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Column( // row kedua
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            TextPointSmall("30°C"),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/cheklist_icon.svg',
                                                  width: 20,
                                                  height: 20,
                                                ),
                                                const SizedBox(width: 8),
                                                TextDescriptionTiny("Kondisi baik")
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
                            ),
                          ],
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
                  Padding(padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
                  child: Column(
                    children: [
                      Container(
                        child: Column (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ComponentTextTitle("Riwayat Pakan Lele"),
                                Spacer(),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextDescriptionSmallAll("Semua"),
                                      SvgPicture.asset(
                                        'assets/icons/right_arrow2.svg',
                                        width: 18,
                                        height: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
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
                        ),
                      ),
                    ],
                  ),)
                ],
              ),
              Container(
                width: double.infinity,
                height: 8,
                color: ListColor.gray100,
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                    child: Column(
                      children: [
                        Container(
                          child: Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ComponentTextTitle("Riwayat Deteksi Penyakit"),
                              SizedBox(height: 16),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  child: Card(
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: const BorderSide(
                                        color: ListColor.gray200,
                                        width: 1,
                                      ),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'assets/icons/lele.jpg',
                                                  width: 80,
                                                  height: 80,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 8),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextDescriptionSmallTiny("Selasa 17 October · 12:32"),
                                              SizedBox(height: 2),
                                              TextDescriptionBold("Lele terjangkit penyakit"),
                                              SizedBox(height: 8),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: ListColor.redAccent,
                                                  borderRadius: BorderRadius.circular(50), // Mengatur sudut container menjadi bulat
                                                ),
                                                child: Padding (
                                                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                                                  child: TextDescriptionSmallBold("Tindakan diperlukan!"),
                                                ),
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
                    ),)
                ],
              ),
            ],
          ),
        ),
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

// child: Column(
// // kenapa terjadi error pada colum ini
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text('Your additional content here'),
// ],
// ),