import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../controller/deteksi/image_upload_service.dart';
import '../../../res/colors/color_libraries.dart';
import '../../component/text/component_desc.dart';
import '../../component/text/component_header.dart';
import '../../component/text/component_textsmall.dart';
import 'hasil_deteksi.dart';

class DeteksiPage extends StatefulWidget {
  const DeteksiPage({super.key});

  @override
  _DeteksiPageState createState() => _DeteksiPageState();
}
class _DeteksiPageState extends State<DeteksiPage> {
  XFile? pickedFile;
  ImageUploadService uploadService = ImageUploadService();
  bool isLoading = false;
  String? penyakitMessage;

  Future<List<DetectionHistory>> fetchHistory() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('riwayat_deteksi');
    DatabaseEvent event = await ref.once();
    List<DetectionHistory> histories = [];

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> values = Map.from(event.snapshot.value as Map);
      values.forEach((key, value) {
        histories.add(DetectionHistory.fromMap(value));
      });
    }
    return histories;
  }

  Future<String> getImageUrl(String imageName) async {
    String url = await FirebaseStorage.instance.ref('image_history/$imageName').getDownloadURL();
    return url;
  }

  void navigateToHasilDeteksi(DetectionHistory selectedHistory) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HasilDeteksi(history: selectedHistory),
      ),
    );
  }

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
        body: Stack(
          children: [
            TabBarView(
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
                              ComponentTextTitleCenter(
                                  "Ingin Mendeteksi Penyakit Lele Kamu?"),
                              SizedBox(height: 32.h),
                              ZoomTapAnimation(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      12.w, 12.h, 12.w, 12.h),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0x7F0A9830),
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
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
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
                                  takeImage();
                                },
                              ),
                              SizedBox(height: 32.h),
                              TextDescriptionSmallW400("Atau"),
                              SizedBox(height: 32.h),
                              Column(
                                children: [
                                  InkWell(
                                    child: DottedBorder(
                                      dashPattern: const [8, 8],
                                      color: ListColor.gray300,
                                      borderType: BorderType.RRect,
                                      radius: const Radius.circular(8),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.fromLTRB(
                                              16.w, 16.h, 16.w, 16.h),
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
                                                TextDescription(
                                                    "Upload Gambar"),
                                                SizedBox(height: 2.h),
                                                TextDescriptionSmallTinyW400(
                                                    "*JPG, JPEG, PNG"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      pickedImage();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: FutureBuilder<List<DetectionHistory>>(
                    future: fetchHistory(),
                    builder: (BuildContext context, AsyncSnapshot<List<DetectionHistory>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                            child: Column(
                              children: [
                                const CircularProgressIndicator(
                                  valueColor:
                                  AlwaysStoppedAnimation<Color>(ListColor.primary),
                                ),
                                SizedBox(height: 4.h),
                                TextDescriptionSmall("Sedang memuat data.."),
                              ],
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            DetectionHistory history = snapshot.data![index];
                            return InkWell(
                              onTap: () {
                                navigateToHasilDeteksi(history);
                              },
                              child: Column(
                                children: [
                                  Card(
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
                                              future: getImageUrl(history.imageName),
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
                                                TextDescriptionSmallTiny("${history.date} · ${history.time}"),
                                                SizedBox(height: 2.h),
                                                TextDescriptionBold(history.condition),
                                                SizedBox(height: 8.h),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: ListColor.redAccent,
                                                    borderRadius: BorderRadius.circular(50),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.fromLTRB(
                                                        12.w, 4.h, 12.w, 4.h),
                                                    child: TextDescriptionSmallBold("Tindakan diperlukan!"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            if (isLoading)
              Center(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LoadingAnimationWidget.staggeredDotsWave(
                          color: ListColor.primary,
                          size: 56,
                        ),
                        SizedBox(height: 2.h),
                        TextDescriptionBoldGreen500("Tunggu! AI kami sedang bekerja untukmu"),
                      ],
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }

  pickedImage() async {
    final picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() => isLoading = true);
    penyakitMessage = await uploadService.uploadImage(pickedFile, context, () =>
        setState(() => isLoading = false));
  }

  takeImage() async {
    final picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() => isLoading = true);
    penyakitMessage = await uploadService.uploadImage(pickedFile, context, () =>
        setState(() => isLoading = false));
  }
}

class DetectionHistory {
  final String time;
  final String condition;
  final String imageName;
  final String date;

  DetectionHistory({
    required this.time,
    required this.condition,
    required this.imageName,
    required this.date,
  });

  factory DetectionHistory.fromMap(Map<dynamic, dynamic> data) {
    return DetectionHistory(
      time: data['jam'] ?? '',
      condition: data['kondisi'] ?? '',
      imageName: data['nama_gambar'] ?? '',
      date: data['tanggal'] ?? '',
    );
  }
}