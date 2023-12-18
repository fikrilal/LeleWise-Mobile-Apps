import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lelewise_mobile_apps/controller/realtime_data/get_weather_data.dart';
import 'package:lelewise_mobile_apps/controller/realtime_data/weather_map_client.dart';
import 'package:lelewise_mobile_apps/controller/state/weather_state.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc_ovr.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';
import 'package:lelewise_mobile_apps/view/page/air/suhu_air_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/notifikasi/notifikasi_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pH/pH_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';
import 'package:location/location.dart';

import '../../../controller/data_pakan/get_data_pakan.dart';
import '../../../controller/deteksi/history_service.dart';
import '../../../controller/realtime_data/get_ph_temperature.dart';
import '../../../models/notification/notification_model.dart';
import '../../component/card/card_history_deteksi.dart';
import '../../component/card/card_pakan_selanjutnya.dart';
import '../../component/card/card_ph.dart';
import '../../component/card/card_suhu.dart';
import '../../component/card/notification_card.dart';

import '../deteksi/history_hasil_deteksi.dart';
import '../notifikasi/detail_notifikasi.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(MyStateController());
  var location = Location();
  late StreamSubscription listener;
  late PermissionStatus permissionStatus;
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
  DetectionHistory? selectedHistory;

  List<Map<String, dynamic>> _dataList = [];

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
      enableLocationListener();
    });
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

  Future<String> getImageUrl(String imageName) async {
    String url = await FirebaseStorage.instance.ref('image_history/$imageName').getDownloadURL();
    return url;
  }

  Future<List<DetectionHistory>> fetchHistory() async {
    return HistoryService.fetchHistory();
  }

  void navigateToHasilDeteksiHistory(DetectionHistory history) {
    setState(() {
      selectedHistory = history;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryHasilDeteksi(history: history),
      ),
    );
  }

  @override
  void dispose() {
    listener.cancel(); // Only cancel if listener is not null
      super.dispose();
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
                              MaterialPageRoute(builder: (context) => DetailNotifikasi(universalMessage: universalMessage)),
                            );
                          },
                          child: NotificationCard(message: universalMessage),
                        ),
                        SizedBox(height: 8.h),
                        Align(
                          alignment: Alignment.center,
                          child: Obx(() => Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Color(0x0A000000),
                                blurRadius: 50,
                                offset: Offset(1, 6),
                                spreadRadius: 0,
                              ),
                            ]),
                            child: controller.locationData.value.latitude != null ?
                            FutureBuilder(future: OpenWeatherMapClient().getWeather(controller.locationData.value),
                                builder: (context, snapshot){
                              if(snapshot.connectionState == ConnectionState.waiting) {
                                return Center(child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                return Center(child: Text(snapshot.error.toString()));
                              } else if (!snapshot.hasData) {
                                return Center(child: Text('Tidak ada data'));
                              } else {
                                var data = snapshot.data as WeatherData;
                                double temperature = data.main!.temp ?? 0.0;
                                double minTemp = data.main!.tempMin ?? 0.0;
                                double maxTemp = data.main!.tempMax ?? 0.0;
                                return Card(
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
                                            TextDescriptionOver("${data.name}, Indonesia")
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            TextPoint("${temperature.toStringAsFixed(0)}°C"),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                TextDescriptionSmall("Terendah: ${minTemp.toStringAsFixed(0)}°C"),
                                                TextDescriptionSmall("Tertinggi: ${maxTemp.toStringAsFixed(0)}°C")
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            }
                            )
                                : const Center(child: Text('Menunggu data')
                                ),
                          ),)
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
                              child: FutureBuilder<List<Map<String, String>>>(
                                future: PakanDataHelper.fetchRiwayatPakanData(),
                                builder: (BuildContext context, AsyncSnapshot<List<Map<String, String>>> snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return SizedBox(
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                                        child: Column(
                                          children: [
                                            const CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(ListColor.primary),
                                            ),
                                            SizedBox(height: 4.h),
                                            TextDescriptionSmall("Sedang memuat data.."),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                  if (snapshot.hasError) {
                                    return Center(child: Text("Error: ${snapshot.error}"));
                                  }
                                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                    return Center(child: Text("No data available"));
                                  }
                                  List<Map<String, String>> limitedData = snapshot.data!.take(5).toList();
                                  return Table(
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
                                    children: limitedData
                                        .map(
                                          (item) => TableRow(
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
                                            verticalAlignment: TableCellVerticalAlignment.middle,
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
                                    )
                                        .toList(),
                                  );
                                },
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ComponentTextTitleCenter("Riwayat Deteksi Penyakit"),
                    SizedBox(height: 16.h),
                    Container(
                      decoration: const BoxDecoration(color: Colors.white),
                      child: FutureBuilder<List<DetectionHistory>>(
                        future: fetchHistory(),
                        builder: (BuildContext context, AsyncSnapshot<List<DetectionHistory>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                child: Column(
                                  children: [
                                    const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(ListColor.primary),
                                    ),
                                    SizedBox(height: 4.h),
                                    TextDescriptionSmall("Sedang memuat data.."),
                                  ],
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            List<DetectionHistory> limitedData = snapshot.data!.take(5).toList();
                            return Column(
                              children: limitedData.map((history) {
                                return InkWell(
                                  onTap: () {
                                    navigateToHasilDeteksiHistory(history);
                                  },
                                  child: Column(
                                    children: [
                                      HistoryCard(
                                        imageUrl: history.imageName, // Make sure this is a correct URL
                                        date: history.date,
                                        time: history.time,
                                        condition: history.condition,
                                      ),
                                      SizedBox(height: 4.h),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          } else {
                            return Text("No data available");
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> enableLocationListener() async {
    controller.isEnableLocation.value = await location.serviceEnabled();
    if(!controller.isEnableLocation.value) {
      controller.isEnableLocation.value = await location.requestService();
      if(!controller.isEnableLocation.value) {
        return;
      }
    }

    permissionStatus = await location.hasPermission();
    if(permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if(permissionStatus != PermissionStatus.granted) {
        return;
      }
    }

    controller.locationData.value = await location.getLocation();
    listener = location.onLocationChanged.listen((event) {

    });
  }
}