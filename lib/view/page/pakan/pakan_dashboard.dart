import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_new_schedule.dart';

import '../../../controller/data_pakan/get_data_pakan.dart';
import '../../component/button/component_primary_btn.dart';
import '../../component/card/card_pakan.dart';
import '../../component/card/card_pakan_selanjutnya.dart';

class PakanDashboard extends StatefulWidget {
  const PakanDashboard({super.key});

  @override
  PakanDashboardState createState() => PakanDashboardState();
}

class PakanDashboardState extends State<PakanDashboard> {
  String _nextFeedingTime = "";
  String _beratPakan = "";
  String _key = "";
  List<Map<String, dynamic>> _dataList = [];
  List<Map<String, dynamic>> _dataListNoFilter = [];

  @override
  void initState() {
    super.initState();
    getDataPakan();
    getDataPakanNoFilter();
    _updatePakanCard();
  }

  void _updatePakanCard() {
    for (var data in _dataListNoFilter) {
      buildPakanCard(context, data);
    }
    setState(() {});
  }

  void getDataPakanNoFilter() async {
    List<Map<String, dynamic>> data =
        await PakanDataHelper.getDataPakanNoFilter();
    setState(() {
      _dataListNoFilter = data;
    });
  }

  Future<void> getDataPakan() async {
    List<Map<String, dynamic>> data = await PakanDataHelper.getDataPakan();
    setState(() {
      _dataList = data;
      if (_dataList.isNotEmpty) {
        _key = _dataList[0]['_key'];
        _nextFeedingTime = _dataList[0]['waktu_pakan'];
        _beratPakan = _dataList[0]['berat_pakan'];
      }
    });
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        child: PakanSelanjutnyaCard(
                                          nextFeedingTime: _nextFeedingTime,
                                          beratPakan: _beratPakan,
                                          idkey: _key,
                                        )),
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
                      height: 8.h,
                      color: ListColor.gray100,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
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
                                      builder: (context) => NewSchedulePage(),
                                    ),
                                  );
                                },
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
