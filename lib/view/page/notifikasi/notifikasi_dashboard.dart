import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lelewise_mobile_apps/view/component/button/component_primary_btn.dart';

import '../../../res/colors/color_libraries.dart';
import '../../component/text/component_big_point.dart';
import '../../component/text/component_desc_ovr.dart';
import '../../component/text/component_header.dart';
import '../../component/text/component_textsmall.dart';

class NotifikasiPage extends StatefulWidget {
  static String? routeName = "/TemplatePage";
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
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
        title: ComponentTextAppBar("Notifikasi"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: ListColor.gray200,
            height: 1.0,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
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
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(12.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: ListColor.gray200,
                                          width: 1,
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/ai_icon.svg',
                                        width: 28.w,
                                        height: 28.h,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          TextDescriptionOver("pH air kolam kamu tinggi!"),
                                          SizedBox(height: 4.h),
                                          TextDescriptionSmallTiny400("Hari ini · 12:30"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                const Divider(
                                  color: ListColor.gray200,
                                  height: 1,
                                ),
                                SizedBox(height: 16.h),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextDescriptionSmall("ph air kolam kamu mencapai 9,51! Kamu perlu mengganti air kolam untuk menjaga kesehatan lele!"),
                                      SizedBox(height: 20.h),
                                      secondaryButton(text: "Lihat Detail", onPressed: () {

                                      },)
                                    ],
                                  ),
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
      ),
    );
  }
}