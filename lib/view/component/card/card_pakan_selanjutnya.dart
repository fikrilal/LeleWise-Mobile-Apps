import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_big_point.dart';

import '../radio_button/radio_button.dart';
import '../text/component_textsmall.dart';

class PakanSelanjutnyaCard extends StatefulWidget {
  final String nextFeedingTime;
  final String beratPakan;
  final String idkey;

  PakanSelanjutnyaCard({
    Key? key,
    required this.nextFeedingTime,
    required this.beratPakan,
    required this.idkey,
  }) : super(key: key);

  @override
  _PakanSelanjutnyaCardState createState() => _PakanSelanjutnyaCardState();
}

class _PakanSelanjutnyaCardState extends State<PakanSelanjutnyaCard> {
  bool _isExpanded = false;
  String? displayedBeratPakan;
  late Future<List<OpsiPakan>> _optionsFuture;

  final DatabaseReference _databaseReference = FirebaseDatabase.instance
      .reference()
      .child('konfigurasi_pakan/konfigurasi_pakan');

  List<OpsiPakan> options = [
    OpsiPakan(id: 1, name: "100"),
    OpsiPakan(id: 2, name: "200"),
    OpsiPakan(id: 3, name: "300"),
    OpsiPakan(id: 4, name: "400"),
  ];
  late OpsiPakan selectedOption;

  @override
  void initState() {
    super.initState();
    _optionsFuture = _fetchOptions();
    selectedOption = options.first;
  }

  Future<List<OpsiPakan>> _fetchOptions() async {
    // harusnya pake waktu yang aktual dari database
    await Future.delayed(Duration(seconds: 4));
    return options;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
        child: FutureBuilder<List<OpsiPakan>>(
            future: _optionsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                      child: Column(
                        children: [
                          const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(ListColor.primary),
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
                options = snapshot.data ?? [];
                displayedBeratPakan ??= widget.beratPakan;
                selectedOption = options.firstWhere(
                    (option) => option.name == displayedBeratPakan,
                    orElse: () => options.first);
                return Column(
                  children: [
                    Row(
                      children: [
                        TextDescriptionSmall(
                            "Jadwal pakan berikutnya pukul ${widget.nextFeedingTime}"),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextPointSmall("${selectedOption.name} Gr"),
                        SizedBox(height: 10.h),
                        AnimatedContainer(
                          height: _isExpanded == true ? 100.h : 0,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedOpacity(
                            opacity: _isExpanded == true ? 1.0 : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
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
                                                  for (var option in options)
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedOption =
                                                              option;
                                                          displayedBeratPakan =
                                                              '${option.name}';
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            24.w),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: option.id ==
                                                                  selectedOption
                                                                      .id
                                                              ? ListColor
                                                                  .primaryAccent
                                                              : Colors
                                                                  .transparent,
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              '${option.name} Gram',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Satoshi',
                                                                fontWeight: option
                                                                            .name ==
                                                                        selectedOption
                                                                            .name
                                                                    ? FontWeight
                                                                        .w700
                                                                    : FontWeight
                                                                        .w500,
                                                                height: 1.5,
                                                                fontSize: 18,
                                                                color: option
                                                                            .name ==
                                                                        selectedOption
                                                                            .name
                                                                    ? ListColor
                                                                        .primary
                                                                    : ListColor
                                                                        .gray600,
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            CustomRadio(
                                                              value: option.id,
                                                              groupValue:
                                                                  selectedOption
                                                                      .id,
                                                              onChanged:
                                                                  (int? value) {
                                                                setState(() {
                                                                  selectedOption =
                                                                      options.firstWhere((opt) =>
                                                                          opt.id ==
                                                                          value);
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
                                        bottom: BorderSide(
                                            width: 1, color: ListColor.gray200),
                                        top: BorderSide(
                                            width: 1, color: ListColor.gray200),
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 24.h, 0, 24.h),
                                      child: Row(
                                        children: [
                                          TextDescription("Berat Pakan"),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              TextDescriptionBoldGreen(
                                                  "${selectedOption.name} Gram"),
                                              SizedBox(width: 8.w),
                                              SvgPicture.asset(
                                                'assets/icons/right_arrow2.svg',
                                                width: 20.w,
                                                height: 20.h,
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
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                shadowColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: const BorderSide(
                                    color: ListColor.gray300,
                                    width: 1,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (_isExpanded) {
                                  setState(() {
                                    _isExpanded = false;
                                  });
                                  updateFirebaseData();
                                } else {
                                  setState(() {
                                    _isExpanded = true;
                                  });
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: TextDescriptionSmallButton(
                                    _isExpanded == true
                                        ? "Simpan"
                                        : "Edit Cepat"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }

  Future<void> updateFirebaseData() async {
    try {
      await _databaseReference.child(widget.idkey).update({
        'berat_pakan': selectedOption.name,
      });
      print("Data updated successfully");
    } catch (e) {
      print("An error occurred while updating data: $e");
    }
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
