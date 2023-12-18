import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../models/notification/notification_helper.dart';
import '../../../res/colors/color_libraries.dart';
import '../../component/text/component_desc.dart';
import '../../component/text/component_desc_ovr.dart';
import '../../component/text/component_header.dart';
import '../../component/text/component_textsmall.dart';

class DetailNotifikasi extends StatefulWidget {
  final String universalMessage;
  DetailNotifikasi({Key? key, required this.universalMessage}) : super(key: key);
  @override
  _DetailNotifikasiState createState() => _DetailNotifikasiState();
}

class _DetailNotifikasiState extends State<DetailNotifikasi> {
  @override
  Widget build(BuildContext context) {
    String iconPath;
    Widget textWidget;
    Map<String, String> details = NotificationHelper.getDetails(widget.universalMessage);
    String deskripsi = details['deskripsi']!;
    String tindakan = details['tindakan']!;


    if (widget.universalMessage == "Kolam lele kamu dalam keadaan baik!") {
      iconPath = 'assets/icons/ai_icon.svg';
      textWidget = TextDescriptionOverGood(widget.universalMessage);
    } else {
      iconPath = 'assets/icons/ai_icon_alert.svg';
      textWidget = TextDescriptionOver2(widget.universalMessage);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ListColor.gray500),
          onPressed: () {
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
              Padding(padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ListColor.gray200,
                                width: 1,
                              ),
                            ),
                            child: SvgPicture.asset(
                              iconPath,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textWidget,
                                SizedBox(height: 8.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      const Divider(
                        color: ListColor.gray200,
                        thickness: 0.8,
                      ),
                      SizedBox(height: 16.h),
                      TextDescription('${deskripsi}'),
                      SizedBox(height: 16.h),
                      const Divider(
                        color: ListColor.gray200,
                        thickness: 0.8,
                      ),
                      SizedBox(height: 16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDescriptionBold("Tindakan yang diperlukan"),
                          SizedBox(height: 8.h),
                          TextDescription('${tindakan}'),
                        ],
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