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

import '../../component/button/component_primary_btn.dart';
import '../../component/time_picker/time_picker.dart';

class NewSchedulePage extends StatefulWidget {
  static String? routeName = "/NewSchedulePage";

  @override
  _NewSchedulePageState createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ListColor.gray500),
          onPressed: () {
            // Tindakan saat tombol kembali ditekan
            Navigator.of(context).pop();
          },
        ),
        title: ComponentTextAppBar("Jadwal Baru"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: ListColor.gray200,
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Column(
              children: [
                TimePickerLele(),
              ],
            ),
            Column(
              children: [
                Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    InkWell(
                      child:
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: ListColor.gray200),
                            bottom: BorderSide(width: 1, color: ListColor.gray200),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                          child: Row(
                            children: [
                              TextDescription700("Berat Pakan"),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/right_arrow2.svg',
                                width: 24,
                                height: 24,
                                color: ListColor.gray500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: ListColor.gray200),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                          child: Row(
                            children: [
                              TextDescription700("Pengulangan"),
                              Spacer(),
                              SvgPicture.asset(
                                'assets/icons/right_arrow2.svg',
                                width: 24,
                                height: 24,
                                color: ListColor.gray500,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                ),
              ],
            ),
            Align(
                alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  primaryButton(text: "+ Jadwal Baru", onPressed: () async {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}