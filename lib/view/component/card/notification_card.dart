import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc_ovr.dart';

class NotificationCard extends StatelessWidget {
  final String message;

  NotificationCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String iconPath;
    Widget textWidget;

    if (message == "Kolam lele kamu dalam keadaan baik!") {
      iconPath = 'assets/icons/ai_icon.svg';
      textWidget = TextDescriptionOverGood(message);
    } else {
      iconPath = 'assets/icons/ai_icon_alert.svg';
      textWidget = TextDescriptionOverAlert(message);
    }

    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: ListColor.gray300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 28.w,
              height: 28.h,
            ),
            SizedBox(width: 16.w),
            Expanded(child: textWidget)
          ],
        ),
      ),
    );
  }
}
