import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/res/dimension/size.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc_ovr.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';
import 'package:lelewise_mobile_apps/view/page/air/suhu_air_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/notifikasi/notifikasi_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pH/pH_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';

import '../../../controller/data_pakan/get_data_pakan.dart';
import '../../../controller/navigation/navigation_controller.dart';
import '../../../controller/realtime_data/get_ph_temperature.dart';
import '../../../models/notification/notification_model.dart';
import '../../component/card/card_pakan_selanjutnya.dart';
import '../../component/card/card_ph.dart';
import '../../component/card/card_suhu.dart';
import '../../component/card/notification_card.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _nextFeedingTime = "";
  String _beratPakan = "";
  String _key = "";

  double ph = 0;
  double suhu = 0;
  String phMessage = "Memuat data pH...";
  String suhuMessage = "Memuat data suhu...";
  String phCondition = "unknown";
  String suhuCondition = "unknown";
  String universalMessage = "Memuat data...";

  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    getDataPakan();
    GetPHandTemperature getPHandTemperature = GetPHandTemperature();

    final notificationModel = NotificationModel(
        onMessagePHUpdate: (message) {
          setState(() {
            phMessage = message;
            if (message == "Terlalu tinggi") {
              phCondition = "high";
            } else if (message == "Kondisi baik") {
              phCondition = "good";
            } else {
              phCondition = "low";
            }
          });
        },
        onMessageSuhuUpdate: (message) {
          setState(() {
            suhuMessage = message;
            if (message == "Terlalu tinggi") {
              suhuCondition = "high";
            } else if (message == "Kondisi baik") {
              suhuCondition = "good";
            } else {
              suhuCondition = "low";
            }
          });
        },
        onUniversalMessageUpdate: (message) {
          setState(() => universalMessage = message);
        }
    );

    getPHandTemperature.getPHStream().listen((newPh) {
      double formattedPh = double.parse(newPh.toStringAsFixed(2));
      setState(() {
        ph = formattedPh;
      });
      notificationModel.handlePHChange(formattedPh);
    });

    getPHandTemperature.getTemperatureStream().listen((newTemperature) {
      double formattedTemperature = double.parse(newTemperature.toStringAsFixed(1));
      setState(() {
        suhu = formattedTemperature;
      });
      notificationModel.handleTemperatureChange(formattedTemperature);
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
                    padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 16.h),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NotifikasiPage()),
                            );
                          },
                          child: NotificationCard(message: universalMessage),
                        ),
                        SizedBox(height: 8.h),
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
                                          'assets/icons/maps_icon.svg',
                                          width: 18.w,
                                          height: 18.h,
                                        ),
                                        SizedBox(width: 8.w),
                                        TextDescriptionOver("Mojoroto, Kediri")
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
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PHPage()),
                                  );
                                },
                                child: PHCard(ph: ph, phMessage: phMessage, phCondition: phCondition),
                              )
                            ),
                            ),
                            Expanded(child:
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SuhuAirPage()),
                                  );
                                },
                                child: SuhuCard(suhu: suhu, suhuMessage: suhuMessage, suhuCondition: suhuCondition),
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
                          child: Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ComponentTextTitleCenter("Pakan Lele"),
                              SizedBox(height: 8.h),
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
                                  child: PakanSelanjutnyaCard(
                                    nextFeedingTime: _nextFeedingTime,
                                    beratPakan: _beratPakan,
                                    idkey: _key,
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
                  Padding(padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0.h),
                  child: Column(
                    children: [
                      Container(
                        child: Column (
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                ComponentTextTitleCenter("Riwayat Pakan Lele"),
                                Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => PakanDashboard()),
                                    );
                                  },
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextDescriptionSmallAll("Semua"),
                                        SvgPicture.asset(
                                          'assets/icons/right_arrow2.svg',
                                          width: 18.w,
                                          height: 18.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            Align(
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
                  Padding(padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                    child: Column(
                      children: [
                        Container(
                          child: Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ComponentTextTitleCenter("Riwayat Deteksi Penyakit"),
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
                                      padding: EdgeInsets.all(10.w),
                                      child: Row(
                                        children: [
                                          Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: Image.asset(
                                                  'assets/icons/lele.jpg',
                                                  width: 80.w,
                                                  height: 80.h,
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 8.w),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextDescriptionSmallTiny("Selasa 17 October · 12:32"),
                                              SizedBox(height: 2.h),
                                              TextDescriptionBold("Lele terjangkit penyakit"),
                                              SizedBox(height: 8.h),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: ListColor.redAccent,
                                                  borderRadius: BorderRadius.circular(50),
                                                ),
                                                child: Padding (
                                                  padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
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
  //
];