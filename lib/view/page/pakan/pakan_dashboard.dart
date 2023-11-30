import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_new_schedule.dart';

import '../../component/button/component_primary_btn.dart';
import '../../component/card/card_pakan.dart';
import '../../component/radio_button/radio_button.dart';

class PakanDashboard extends StatefulWidget {
  static String? routeName = "/PakanDashboard";

  @override
  _PakanDashboardState createState() => _PakanDashboardState();
}

class _PakanDashboardState extends State<PakanDashboard> {
  List<OpsiPakan> options2 = [
    OpsiPakan(id: 1, name: "100 Gram"),
    OpsiPakan(id: 2, name: "200 Gram"),
    OpsiPakan(id: 3, name: "300 Gram"),
    OpsiPakan(id: 4, name: "400 Gram"),
  ];
  OpsiPakan selectedOption2 = OpsiPakan(id: 1, name: "100 Gram");
  String _nextFeedingTime  = "";
  String _beratPakan  = "";
  bool _isExpanded = false;
  final DatabaseReference _databaseReference =
  FirebaseDatabase.instance.reference().child('konfigurasi_pakan/konfigurasi_pakan');

  List<Map<String, dynamic>> _dataList = [];
  List<Map<String, dynamic>> _dataListNoFilter = [];

  @override
  void initState() {
    super.initState();
    _getDataFromFirebase();
    getDataFromFirebaseNoFilter();
    _updatePakanCard();
  }

  void _updatePakanCard() {
    for (var data in _dataListNoFilter)
      buildPakanCard(context, data);
    setState(() {});
  }

  void getDataFromFirebaseNoFilter() {
    _databaseReference.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        List<Map<dynamic, dynamic>> dataListNoFilter = List<Map<dynamic, dynamic>>.from(snapshot.value as List<Object?>? ?? []);
        dataListNoFilter.forEach((data) {
          String keyNoFilter = data['_key'].toString();
          String pengulanganNoFilter = data['pengulangan'].toString();
          String beratPakanNoFilter = data['berat_pakan'].toString();
          String waktuPakanNoFilter = data['waktu_pakan'].toString();
          _dataListNoFilter.add({
            '_key': keyNoFilter,
            'pengulangan': pengulanganNoFilter,
            'berat_pakan': beratPakanNoFilter,
            'waktu_pakan': waktuPakanNoFilter,
          });
        });
        print("Sebelum pengurutan: $_dataListNoFilter");
        setState(() {});
      }
    });
  }

  String getDataNoFilter(String fieldName) {
    // Assuming you want the first value, you can modify as needed
    if (_dataListNoFilter.isNotEmpty) {
      return _dataListNoFilter[0][fieldName] ?? "";
    } else {
      return "";
    }
  }

  Future<void> _getDataFromFirebase() async {
    final DateTime currentTime = DateTime.now();
    final String formattedTime = DateFormat('HH:mm').format(currentTime);
    _databaseReference.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        List<Map<dynamic, dynamic>> dataList = List<Map<dynamic, dynamic>>.from(snapshot.value as List<Object?>? ?? []);
        dataList.forEach((data) {
          String key = data['_key'].toString();
          String pengulangan = data['pengulangan'].toString();
          String beratPakan = data['berat_pakan'].toString();
          String waktuPakan = data['waktu_pakan'].toString();

          _dataList.add({
            '_key': key,
            'pengulangan': pengulangan,
            'berat_pakan': beratPakan,
            'waktu_pakan': waktuPakan,
          });
        });
        _dataList.sort((a, b) {
          return DateFormat('HH:mm').parse(a['waktu_pakan']).compareTo(DateFormat('HH:mm').parse(b['waktu_pakan']));
        });
        if (_dataList.isNotEmpty) {
          setState(() {
            _nextFeedingTime = _dataList[0]['waktu_pakan'];
            _beratPakan = _dataList[0]['berat_pakan'];
          });
        } else {
          setState(() {
            _nextFeedingTime = "";
            _beratPakan = "";
          });
        }
      }
    });
  }

  String getBeratPakan() {
    return _beratPakan;
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                fontSize: 18,
              ),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: ListColor.gray500,
                fontSize: 18,
              ),
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
                                    ComponentTextTitle("Jadwal berikutnya"),
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
                                                    TextDescriptionSmall("Jadwal pakan berikutnya pukul $_nextFeedingTime"),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ComponentTextTitle("Jadwal pakan"),
                                    SizedBox(height: 8.h),
                                    for (var data in _dataListNoFilter)
                                      buildPakanCard(context, data),
                                    SizedBox(height: 32.h),
                                    primaryButton(
                                      text: "+ Jadwal Baru",
                                      onPressed: () async {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                NewSchedulePage(),
                                          ),
                                        );
                                      },
                                    ),
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
                      padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 0.h),
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
                                    width: 1.0,
                                    color: ListColor.gray200,
                                  ),
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: ListColor.gray200,
                                  ),
                                ),
                                children: [
                                  for (var item in dataArray)
                                    TableRow(
                                      children: [
                                        TableCell(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 24.h,
                                              top: 24.h,
                                            ),
                                            child: TextDescription(
                                              item["name"] ?? "",
                                            ),
                                          ),
                                        ),
                                        TableCell(
                                          verticalAlignment:
                                          TableCellVerticalAlignment.middle,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 24.h,
                                              top: 24.h,
                                            ),
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: TextDescription(
                                                item["date"] ?? "",
                                              ),
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
              ),
            ),
          ],
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

class OpsiPakan {
  final int id;
  final String name;

  OpsiPakan({
    required this.id,
    required this.name,
  });
}