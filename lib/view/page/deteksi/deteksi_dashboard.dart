import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../res/colors/color_libraries.dart';
import '../../component/text/component_desc.dart';
import '../../component/text/component_header.dart';
import '../../component/text/component_textsmall.dart';

class DeteksiPage extends StatefulWidget {
  static String? routeName = "/DeteksiPage";
  @override
  _DeteksiPageState createState() => _DeteksiPageState();
}
class _DeteksiPageState extends State<DeteksiPage> {
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
                  child: Text("Deteksi"),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                            children: [
                              SizedBox(height: 8.h),
                              ComponentTextTitleCenter("Ingin Mendeteksi Penyakit Lele Kamu?"),
                              SizedBox(height: 32.h),
                              ZoomTapAnimation(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color(0x7F0A9830),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Container(
                                    width: 230.w,
                                    height: 230.h,
                                    decoration: const BoxDecoration(
                                      color: ListColor.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/Scan.svg',
                                          width: 60.w,
                                          height: 60.h,
                                        ),
                                        SizedBox(height: 8.h),
                                        TextDescriptionBold24("Ambil Gambar"),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                },
                              ),
                              SizedBox(height: 32.h),
                              TextDescriptionSmallW400("Atau"),
                              SizedBox(height: 32.h),
                              Column(
                                children: [
                                  GestureDetector(
                                    child: DottedBorder(
                                      dashPattern: const [8, 8],
                                      color: ListColor.gray300,
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(8),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                                          decoration: const BoxDecoration(
                                            color: ListColor.gray50,
                                          ),
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/upload.svg',
                                                  width: 24.w,
                                                  height: 24.h,
                                                ),
                                                SizedBox(height: 8.h),
                                                TextDescription("Upload"),
                                                SizedBox(height: 2.h),
                                                TextDescriptionSmallTinyW400("*JPG, JPEG, PNG"),
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
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                          child: Column(
                           children: [
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
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(16),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}