import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lelewise_mobile_apps/view/component/card/card_ph.dart';
import 'package:lelewise_mobile_apps/view/component/card/card_suhu.dart';

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
              Row(
                children: [
                  Expanded(
                    child: PHCard(
                        ph: ph, phMessage: phMessage, phCondition: phCondition),
                  ),
                  Expanded(
                    child: SuhuCard(
                        suhu: suhu,
                        suhuMessage: suhuMessage,
                        suhuCondition: suhuCondition),
                  )
                ],
              ),
              SizedBox(height: 16.h),
              ComponentTextTitleCenter("Riwayat pH & Suhu Air"),
              SizedBox(height: 20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDescription16("pastDates[index]"),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      TextDescriptionBold("Ini temperatur"),
                      const Spacer(),
                      TextDescriptionBold("Ini pH"),
                    ],
                  )
                ],
              ),
              SizedBox(height: 12.h),
              const Divider(
                color: ListColor.gray200,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> generatePastDates(DateTime startDate, int days) {
    List<String> dates = [];
    DateFormat dateFormat = DateFormat('EEEE, dd MMMM', 'id_ID');

    for (int i = 0; i < days; i++) {
      DateTime currentDate = startDate.subtract(Duration(days: i));
      dates.add(dateFormat.format(currentDate));
    }
    return dates;
  }
}
