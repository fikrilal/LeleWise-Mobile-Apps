import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/radio_button/radio_button.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';

import '../../component/button/component_primary_btn.dart';
import '../../component/time_picker/time_picker.dart';
import '../../component/time_picker/time_picker_normal.dart';

class NewSchedulePage extends StatefulWidget {
  static String? routeName = "/NewSchedulePage";

  @override
  _NewSchedulePageState createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {
  late String currentDate;
  String? selectedTime;
  List<OpsiPakan> pakanOptions = [
    OpsiPakan(id: 1, name: "100"),
    OpsiPakan(id: 2, name: "200"),
    OpsiPakan(id: 3, name: "300"),
    OpsiPakan(id: 4, name: "400"),
  ];
  OpsiPakan opsiPakan = OpsiPakan(id: 1, name: "100");

  List<OpsiPengulangan> pengulanganOptions = [
    OpsiPengulangan(id: 1, name: "Setiap Hari"),
    OpsiPengulangan(id: 2, name: "Satu Kali"),
  ];
  OpsiPengulangan opsiPengulangan = OpsiPengulangan(id: 1, name: "Setiap Hari");

  @override
  void initState() {
    super.initState();
    _getCurrentDate();
  }

  void _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM-dd-yyyy').format(now);
    setState(() {
      currentDate = formattedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                TimePickerLeleNormal(
                  onTimeSelected: (int hour, int minute, int period) {
                    String formattedHour = hour.toString().padLeft(2, '0');
                    String formattedMinute = minute.toString().padLeft(2, '0');

                    // Convert the hour to 24-hour format
                    if (period == 0) {
                      formattedHour = formattedHour;
                    } else {
                      formattedHour = (hour + 12).toString().padLeft(2, '0');
                    }

                    selectedTime = '$formattedHour:$formattedMinute';
                    print('Selected Time: $selectedTime $period');
                  },
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Column(
              children: [
                Padding(padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 20.h),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            builder: ((context) {
                              return IntrinsicHeight(
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 32.h),
                                      for (var option in pakanOptions)
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              opsiPakan = option;
                                            });
                                            Navigator.pop(context); // Tutup ModalBottomSheet
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(24.h),
                                            decoration: BoxDecoration(
                                              color: option.id == opsiPakan.id ? ListColor.primaryAccent : Colors.transparent,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  '${option.name} Gram',
                                                style: TextStyle(
                                                fontFamily: 'Satoshi',
                                                fontWeight: option.name == opsiPakan.name ? FontWeight.w700 : FontWeight.w500,
                                                height: 1.5,
                                                fontSize: 18,
                                                color: option.name == opsiPakan.name ? ListColor.primary : ListColor.gray600,
                                                ),
                                                ),
                                                Spacer(),
                                                CustomRadio(
                                                  value: option.id,
                                                  groupValue: opsiPakan.id,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      opsiPakan = pakanOptions.firstWhere((opt) => opt.id == value);
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: ListColor.gray200),
                            bottom: BorderSide(width: 1, color: ListColor.gray200),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 24.h, 0, 24.h),
                          child: Row(
                            children: [
                              TextDescription("Berat Pakan"),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextDescriptionBoldGreen("${opsiPakan.name} Gram"),
                                  SizedBox(width: 8.w),
                                  SvgPicture.asset(
                                    'assets/icons/right_arrow2.svg',
                                    width: 24.w,
                                    height: 24.h,
                                    color: ListColor.gray500,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            builder: ((context) {
                              return IntrinsicHeight(
                                child: Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 32.h),
                                      for (var option2 in pengulanganOptions)
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            opsiPengulangan = option2;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(24.w),
                                          decoration: BoxDecoration(
                                            color: option2.id == opsiPengulangan.id ? ListColor.primaryAccent : Colors.transparent,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                option2.name,
                                                style: TextStyle(
                                                  fontFamily: 'Satoshi',
                                                  fontWeight: option2.name == opsiPengulangan.name ? FontWeight.w700 : FontWeight.w500,
                                                  height: 1.5,
                                                  fontSize: 18,
                                                  color: option2.name == opsiPengulangan.name ? ListColor.primary : ListColor.gray600,
                                                ),
                                              ),
                                              Spacer(),
                                              CustomRadio(
                                                value: option2.id,
                                                groupValue: opsiPengulangan.id,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    opsiPengulangan = pengulanganOptions.firstWhere((opt) => opt.id == value);
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1, color: ListColor.gray200),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 24.h, 0, 24.h),
                          child: Row(
                            children: [
                              TextDescription("Pengulangan"),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextDescriptionBoldGreen("${opsiPengulangan.name}"),
                                  SizedBox(width: 8.w),
                                  SvgPicture.asset(
                                    'assets/icons/right_arrow2.svg',
                                    width: 24.w,
                                    height: 24.h,
                                    color: ListColor.gray500,
                                  ),
                                ],
                              )
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
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(16.w, 24.h, 16.w, 32.h),
                child: primaryButton(
                  text: "Simpan",
                  onPressed: () async {
                    await _saveDataToFirebase();
                    Navigator.pop(context); // This line will navigate back
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _saveDataToFirebase() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM-dd-yyyy').format(now);
    String formattedTime = selectedTime ?? DateFormat('HH:mm').format(now);

    DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child('konfigurasi_pakan');

    int lastId = await _databaseReference.child('/autoIncrement').get().then((DataSnapshot? data) {
      if (data != null && data.value != null) {
        return data.value as int;
      } else {
        return 0;
      }
    });

    String newEntryKey = 'konfigurasi_pakan/$lastId';
    DatabaseReference newEntryRef = _databaseReference.push();

    Map<String, dynamic> newData = {
      '_key': lastId,
      'berat_pakan': opsiPakan.name,
      'pengulangan': opsiPengulangan.name,
      'tanggal': formattedDate,
      'waktu_pakan': formattedTime,
    };

    await _databaseReference.child(newEntryKey).set(newData);

    await _databaseReference.child('/autoIncrement').set(lastId + 1);
  }

}

class OpsiPakan {
  final int id;
  final String name;

  OpsiPakan({
    required this.id,
    required this.name,
  });
}

class OpsiPengulangan {
  final int id;
  final String name;

  OpsiPengulangan({
    required this.id,
    required this.name,
  });
}
