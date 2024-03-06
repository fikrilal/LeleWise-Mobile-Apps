import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lelewise_mobile_apps/view/component/card/card_ph.dart';
import 'package:lelewise_mobile_apps/view/component/card/card_suhu.dart';


import '../../../controller/ph_suhu/get_history_ph_suhu.dart';
import '../../../controller/realtime_data/get_ph_temperature.dart';
import '../../../models/notification/notification_model.dart';
import '../../../res/colors/color_libraries.dart';
import '../../component/text/component_desc.dart';
import '../../component/text/component_header.dart';

class MonitoringDashboard extends StatefulWidget {
  const MonitoringDashboard({super.key});

  @override
  State<MonitoringDashboard> createState() => _MonitoringDashboardState();
}

class _MonitoringDashboardState extends State<MonitoringDashboard> {
  double ph = 0;
  double suhu = 0;
  String phMessage = "Memuat data pH...";
  String suhuMessage = "Memuat data suhu...";
  String phCondition = "unknown";
  String suhuCondition = "unknown";
  String universalMessage = "Memuat data...";

  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {});
    GetPHandTemperature getPHandTemperature = GetPHandTemperature();

    final notificationModel = NotificationModel(onMessagePHUpdate: (message) {
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
    }, onMessageSuhuUpdate: (message) {
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
    }, onUniversalMessageUpdate: (message) {
      setState(() => universalMessage = message);
    });

    getPHandTemperature.getPHStream().listen((newPh) {
      double formattedPh = double.parse(newPh.toStringAsFixed(2));
      setState(() {
        ph = formattedPh;
      });
      notificationModel.handlePHChange(formattedPh);
    });

    getPHandTemperature.getTemperatureStream().listen((newTemperature) {
      double formattedTemperature =
      double.parse(newTemperature.toStringAsFixed(1));
      setState(() {
        suhu = formattedTemperature;
      });
      notificationModel.handleTemperatureChange(formattedTemperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(16.w, 46.h, 16.w, 20.h),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: PHCard(
                        ph: ph, phMessage: phMessage, phCondition: phCondition),
                  ),
                  Expanded(
                    child: SuhuCard(suhu: suhu,
                        suhuMessage: suhuMessage,
                        suhuCondition: suhuCondition),
                  )
                ],
              ),
              SizedBox(height: 16.h),
              ComponentTextTitleCenter("Riwayat pH & Suhu Air"),
              SizedBox(height: 20.h),
              FutureBuilder<List<PHAndTemperatureHistory>>(
                future: HistoryService.fetchPHAndTemperatureHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else if (snapshot.hasData) {
                    var data = snapshot.data!;
                    var pastDates = generatePastDates(
                        DateTime.now(), data.length);
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            TextDescription16(pastDates[index]),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                TextDescriptionBold(
                                    "${data[index].temperature.toStringAsFixed(
                                        0)}°C"),
                                Spacer(),
                                TextDescriptionBold(
                                    "pH ${data[index].ph.toStringAsFixed(1)}"),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            const Divider(color: ListColor.gray200),
                          ],
                        );
                      },
                    );
                  } else {
                    return Text("No data available");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> generatePastDates(DateTime startDate, int count) {
    List<String> dates = [];
    DateFormat dateFormat = DateFormat('EEEE, dd MMMM', 'id_ID');

    for (int i = 0; i < count; i++) {
      DateTime currentDate = startDate.subtract(Duration(days: i));
      dates.add(dateFormat.format(currentDate));
    }
    return dates;
  }
}