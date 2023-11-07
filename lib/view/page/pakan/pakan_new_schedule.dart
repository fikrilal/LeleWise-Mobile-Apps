import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/radio_button/radio_button.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';

import '../../component/button/component_primary_btn.dart';
import '../../component/time_picker/time_picker.dart';

class NewSchedulePage extends StatefulWidget {
  static String? routeName = "/NewSchedulePage";

  @override
  _NewSchedulePageState createState() => _NewSchedulePageState();
}

class _NewSchedulePageState extends State<NewSchedulePage> {


  List<OpsiPakan> options = [
    OpsiPakan(id: 1, name: "100 Gram"),
    OpsiPakan(id: 2, name: "200 Gram"),
    OpsiPakan(id: 3, name: "300 Gram"),
    OpsiPakan(id: 4, name: "400 Gram"),
  ];
  OpsiPakan selectedOption = OpsiPakan(id: 1, name: "100 Gram");

  List<OpsiPengulangan> options2 = [
    OpsiPengulangan(id: 1, name: "Setiap Hari"),
    OpsiPengulangan(id: 2, name: "Satu Kali"),
  ];
  OpsiPengulangan selectedOption2 = OpsiPengulangan(id: 1, name: "Setiap Hari");

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
                TimePickerLele(),
              ],
            ),
            SizedBox(height: 8),
            Column(
              children: [
                Padding(padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                      SizedBox(height: 32),
                                      for (var option in options)
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectedOption = option;
                                            });
                                            Navigator.pop(context); // Tutup ModalBottomSheet
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(24.0),
                                            decoration: BoxDecoration(
                                              color: option.id == selectedOption.id ? ListColor.primaryAccent : Colors.transparent,
                                            ),
                                            child: Row(
                                              children: [
                                                Text(
                                                  option.name,
                                                style: TextStyle(
                                                fontFamily: 'Satoshi',
                                                fontWeight: option.name == selectedOption.name ? FontWeight.w700 : FontWeight.w500,
                                                height: 1.5,
                                                fontSize: 18,
                                                color: option.name == selectedOption.name ? ListColor.primary : ListColor.gray600,
                                                ),
                                                ),
                                                Spacer(),
                                                CustomRadio(
                                                  value: option.id,
                                                  groupValue: selectedOption.id,
                                                  onChanged: (int? value) {
                                                    setState(() {
                                                      selectedOption = options.firstWhere((opt) => opt.id == value);
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
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                          child: Row(
                            children: [
                              TextDescription("Berat Pakan"),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextDescriptionBoldGreen("${selectedOption.name}"),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                    'assets/icons/right_arrow2.svg',
                                    width: 24,
                                    height: 24,
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
                                      SizedBox(height: 32),
                                      for (var option2 in options2)
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedOption2 = option2;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(24.0),
                                          decoration: BoxDecoration(
                                            color: option2.id == selectedOption2.id ? ListColor.primaryAccent : Colors.transparent,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                option2.name,
                                                style: TextStyle(
                                                  fontFamily: 'Satoshi',
                                                  fontWeight: option2.name == selectedOption2.name ? FontWeight.w700 : FontWeight.w500,
                                                  height: 1.5,
                                                  fontSize: 18,
                                                  color: option2.name == selectedOption2.name ? ListColor.primary : ListColor.gray600,
                                                ),
                                              ),
                                              Spacer(),
                                              CustomRadio(
                                                value: option2.id,
                                                groupValue: selectedOption2.id,
                                                onChanged: (int? value) {
                                                  setState(() {
                                                    selectedOption2 = options2.firstWhere((opt) => opt.id == value);
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
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
                          child: Row(
                            children: [
                              TextDescription("Pengulangan"),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  TextDescriptionBoldGreen("${selectedOption2.name}"),
                                  SizedBox(width: 8),
                                  SvgPicture.asset(
                                    'assets/icons/right_arrow2.svg',
                                    width: 24,
                                    height: 24,
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
                padding: EdgeInsets.fromLTRB(20, 24, 20, 32),
                child: primaryButton(text: "Simpan", onPressed: () async {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PakanDashboard()),
                );}),
              ),
            )
          ],
        ),
      ),
    );
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
