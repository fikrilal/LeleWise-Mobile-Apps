import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/radio_button/radio_button.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';

import '../../component/button/component_primary_btn.dart';
import '../../component/time_picker/time_picker.dart';

class EditPakanPage extends StatefulWidget {
  static String? routeName = "/NewSchedulePage";
  final Map<String, dynamic> data;
  EditPakanPage({required this.data});

  @override
  _EditPakanPageState createState() => _EditPakanPageState();
}

class _EditPakanPageState extends State<EditPakanPage> {
  late String currentDate;
  String selectedTime = '';
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

  late String beratPakan;
  late String waktuPakan;
  late String displayedBeratPakan;
  late String displayedWaktuPakan;

  @override
  void initState() {
    super.initState();
    _getCurrentDate();
    _getPassedData();
    displayedBeratPakan = widget.data['berat_pakan'] ?? '';
    displayedWaktuPakan = widget.data['waktu_pakan'] ?? '';
  }

  void _getPassedData() {
    // Mendapatkan nilai berat_pakan dan waktu_pakan dari data yang dipassing
    beratPakan = widget.data['berat_pakan'] ?? '';
    waktuPakan = widget.data['waktu_pakan'] ?? '';

    setState(() {
      displayedBeratPakan = beratPakan;
      displayedWaktuPakan = waktuPakan;
    });

    print('Berat Pakan: $displayedBeratPakan');
    print('Waktu Pakan: $displayedWaktuPakan');
  }

  void _getCurrentDate() {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM-dd-yyyy').format(now);
    setState(() {
      currentDate = formattedDate;
    });
  }

  int getInitialHour(String? waktuPakan) {
    if (waktuPakan != null && waktuPakan.isNotEmpty) {
      List<String> timeComponents = waktuPakan.split(':');
      if (timeComponents.length == 2) {
        return int.parse(timeComponents[0]);
      }
    }
    return DateTime.now().hour;
  }

  int getInitialMinute(String? waktuPakan) {
    if (waktuPakan != null && waktuPakan.isNotEmpty) {
      List<String> timeComponents = waktuPakan.split(':');
      if (timeComponents.length == 2) {
        return int.parse(timeComponents[1]);
      }
    }
    return DateTime.now().minute;
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
                TimePickerLele(
                  initialHour: getInitialHour(widget.data['waktu_pakan']),
                  initialMinute: getInitialMinute(widget.data['waktu_pakan']),
                  onTimeSelected: (int hour, int minute, int period) {
                    // Logika pengolahan waktu pilihan
                    String formattedHour = hour.toString().padLeft(2, '0');
                    String formattedMinute = minute.toString().padLeft(2, '0');

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
                                                displayedBeratPakan = '${option.name}';
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
                                    TextDescriptionBoldGreen("$displayedBeratPakan Gram"), // BERAT PAKAN DARI HASIL PASSING, AKAN BERGANTI JIKA PENGGUNA MEMILIH OPSI BARU
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
    String formattedTime = selectedTime;

    // Replace 'konfigurasi_pakan' with your actual path
    DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child('konfigurasi_pakan');

    // Get the last auto increment ID
    int lastId = await _databaseReference.child('/autoIncrement').get().then((DataSnapshot? data) {
      if (data != null && data.value != null) {
        return data.value as int;
      } else {
        // Handle the case where data is null or the value is not an int
        return 0; // or any default value you prefer
      }
    });

    // Generate the new key
    String newEntryKey = 'konfigurasi_pakan/$lastId';

    // Create a map with the data you want to save
    Map<String, dynamic> newData = {
      'berat_pakan': opsiPakan.name,
      'pengulangan': opsiPengulangan.name,
      'tanggal': formattedDate,
      'waktu_pakan': formattedTime,
    };

    // Save the data to the database under the new key
    await _databaseReference.child(newEntryKey).set(newData);

    // Increment the auto increment ID
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
