import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/colors/color_libraries.dart';
import '../text/component_desc.dart';
import '../text/component_textsmall.dart';


class HistoryCard extends StatefulWidget {
  final String imageUrl;
  final String date;
  final String time;
  final String condition;

  HistoryCard({
    required this.imageUrl,
    required this.date,
    required this.time,
    required this.condition,
  });

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  Future<String> getImageUrl(String imageName) async {
    String url = await FirebaseStorage.instance.ref('image_history/$imageName').getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: FutureBuilder<String>(
                future: getImageUrl(widget.imageUrl),
                builder: (BuildContext context, AsyncSnapshot<String> imageSnapshot) {
                  if (imageSnapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (imageSnapshot.hasError) {
                    if (kDebugMode) {
                      print('Error loading image: ${imageSnapshot.error}');
                    }
                    return const Icon(Icons.error);
                  } else if (!imageSnapshot.hasData) {
                    return const Text('No image data');
                  } else {
                    return Image.network(
                      imageSnapshot.data!,
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.fitHeight,
                      loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return const CircularProgressIndicator(
                            valueColor:
                            AlwaysStoppedAnimation<Color>(ListColor.primary),
                          );
                        }
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextDescriptionSmallTiny("${widget.date} · ${widget.time}"),
                  SizedBox(height: 2.h),
                  TextDescriptionBold(
                      widget.condition  == 'Sakit' ? "Lele terjangkit penyakit" :
                      widget.condition  == 'Sehat' ? "Lele dalam keadaan sehat" :
                      "Status Tidak Diketahui"),
                  SizedBox(height: 8.h),
                  if (widget.condition == 'Sakit')
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Hicons.danger_circle_bold, color: ListColor.red, size: 20),
                        SizedBox(width: 4.w),
                        TextDescriptionSmallBoldAlert("Tindakan diperlukan!"),
                      ],
                    ),
                  if (widget.condition == 'Sehat')
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Hicons.tick_circle_bold, color: ListColor.primary, size: 20),
                        SizedBox(width: 4.w),
                        TextDescriptionSmallBoldGood("Kondisi baik"),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
