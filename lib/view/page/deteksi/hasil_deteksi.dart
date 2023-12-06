import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../res/colors/color_libraries.dart';
import '../../component/text/component_desc.dart';
import '../../component/text/component_desc_ovr.dart';
import '../../component/text/component_header.dart';
import '../../component/text/component_textsmall.dart';
import 'deteksi_dashboard.dart';

class HasilDeteksi extends StatefulWidget {
  final DetectionHistory history;

  HasilDeteksi({required this.history});

  @override
  _HasilDeteksiState createState() => _HasilDeteksiState();

}

class _HasilDeteksiState extends State<HasilDeteksi> {
  late Future<String> imageUrl;

  @override
  void initState() {
    super.initState();
    // Call the getImageUrl method here
    imageUrl = getImageUrl(widget.history.imageName);
  }

  Future<String> getImageUrl(String imageName) async {
    String url = await FirebaseStorage.instance.ref('image_history/$imageName').getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    DetectionHistory selectedHistory = widget.history;
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
        title: ComponentTextAppBar("Hasil Deteksi"),
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FutureBuilder(
                        future: imageUrl,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Container(
                                width: double.infinity,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                                  child: const Column(
                                    children: [
                                      CircularProgressIndicator(
                                        valueColor:
                                        AlwaysStoppedAnimation<Color>(ListColor.primary),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error loading image');
                            } else {
                              return Image.network(
                                snapshot.data as String, // Use the imageUrl from the snapshot
                                width: double.infinity,
                                height: 150.h,
                                fit: BoxFit.cover,
                              );
                            }
                          }
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                width: 24.w,
                                height: 24.h,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextDescriptionCut("Lele kamu terjangkit penyakit Cotton Wool!"),
                                  // TextDescriptionCut(selectedHistory.condition),
                                  SizedBox(height: 8.h),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Container(
                                      //   decoration: BoxDecoration(
                                      //     color: ListColor.redAccent,
                                      //     borderRadius: BorderRadius.circular(50),
                                      //   ),
                                      //   child: Padding (
                                      //     padding: EdgeInsets.fromLTRB(12.w, 4.h, 12.w, 4.h),
                                      //     child: TextDescriptionSmallBold("Tindakan diperlukan!"),
                                      //   ),
                                      // ),
                                      TextDescriptionSmallTiny400("${selectedHistory.date} · ${selectedHistory.time}"),
                                    ],
                                  ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDescriptionBold("Tentang penyakit"),
                            SizedBox(height: 8.h),
                            TextDescription("Penyakit Cotton Wool pada lele adalah penyakit yang disebabkan oleh jamur Saprolegnia sp. Jamur ini tumbuh pada jaringan tubuh yang mati atau ikan yang kondisinya lemah. Gejala penyakit ini adalah munculnya benang-benang halus seperti kapas pada tubuh ikan, terutama di bagian yang terdapat luka. Ikan yang terinfeksi penyakit ini akan menjadi lemah dan sering menggosok-gosokkan tubuh pada dasar atau dinding kolam."),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        const Divider(
                          color: ListColor.gray200,
                          thickness: 0.8,
                        ),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDescriptionBold("Penyebab umum"),
                            SizedBox(height: 8.h),
                            TextDescription("Kualitas air yang buruk, terutama suhu air yang rendah dan kandungan oksigen yang rendah. Kepadatan ikan yang tinggi. Ikan yang stres karena kekurangan makanan atau serangan penyakit lain. Luka pada tubuh ikan akibat benturan atau serangan predator."),
                          ],
                        ),
                        const Divider(
                          color: ListColor.gray200,
                          thickness: 0.8,
                        ),
                        SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextDescriptionBold("Penanganan"),
                            SizedBox(height: 8.h),
                            TextDescription("Untuk mencegah penyakit Cotton Wool pada lele, perlu dilakukan sejumlah tindakan pencegahan yang terfokus pada perawatan kolam. Hal ini melibatkan menjaga kualitas air, seperti mempertahankan suhu antara 28-30 derajat Celcius dan kandungan oksigen pada 5-6 ppm. Selain itu, penting juga untuk menjaga kepadatan ikan sekitar 300 ekor per meter persegi, memberikan pakan berkualitas, dan secara rutin membersihkan kolam dari kotoran serta sisa pakan. Dengan langkah-langkah ini, diharapkan dapat menciptakan lingkungan yang optimal untuk pertumbuhan lele dan mengurangi risiko penyakit dalam populasi ikan."),
                          ],
                        ),
                      ],
                    )
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