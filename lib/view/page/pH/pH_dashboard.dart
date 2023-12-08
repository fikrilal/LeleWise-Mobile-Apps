import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textsmall.dart';

import '../../../controller/ph_suhu/get_history_ph_suhu.dart';
import '../../../controller/realtime_data/get_ph_temperature.dart';
import '../../component/text/component_desc_ovr.dart';

class PHPage extends StatefulWidget {
  const PHPage({super.key});

  @override
  _PHPageState createState() => _PHPageState();
}

class _PHPageState extends State<PHPage> {
  double ph = 0;

  @override
  void initState() {
    super.initState();
    GetPHandTemperature getPHandTemperature = GetPHandTemperature();

    getPHandTemperature.getPHStream().listen((nePH) {
      double formattedTemperature = double.parse(nePH.toStringAsFixed(1));
      setState(() {
        ph = formattedTemperature;
      });
    });
  }

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
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/water.svg',
                                width: 24.w,
                                height: 24.h,
                              ),
                              SizedBox(width: 8.h),
                              TextDescriptionOver("pH air hari ini")
                            ],
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            children: [
                              TextPoint("$ph"),
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
                          // Row(
                          //   children: [
                          //     SvgPicture.asset(
                          //       'assets/icons/cheklist_icon.svg',
                          //       width: 20.w,
                          //       height: 20.h,
                          //     ),
                          //     SizedBox(width: 8.w),
                          //     TextDescriptionTiny("Dalam keadaan baik")
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ComponentTextTitleCenter("Riwayat pH Air"),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.center,
                    child: FutureBuilder<List<PHAndTemperatureHistory>>(
                      future: HistoryService.fetchPHAndTemperatureHistory(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text("Error: ${snapshot.error}");
                        } else if (snapshot.hasData) {
                          return buildTemperatureTable(snapshot.data!);
                        } else {
                          return Text("No data available");
                        }
                      },
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

Widget buildTemperatureTable(List<PHAndTemperatureHistory> data) {
  return Table(
    border: const TableBorder(
      horizontalInside: BorderSide(width: 1.0, color: ListColor.gray200),
      bottom: BorderSide(width: 1.0, color: ListColor.gray200),
    ),
    children: data.map((item) => TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: EdgeInsets.only(bottom: 24.h, top: 24.h),
            child: TextDescription("${item.ph}"),
          ),
        ),
        // Include other cells if needed
      ],
    )).toList(),
  );
}
