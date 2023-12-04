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

  PakanSelanjutnyaCard({
    Key? key,
    required this.nextFeedingTime,
    required this.beratPakan,
  }) : super(key: key);

  @override
  _PakanSelanjutnyaCardState createState() => _PakanSelanjutnyaCardState();
}

class _PakanSelanjutnyaCardState extends State<PakanSelanjutnyaCard> {
  bool _isExpanded = false;

  List<OpsiPakan> options = [
    OpsiPakan(id: 1, name: "100 Gram"),
    OpsiPakan(id: 2, name: "200 Gram"),
    OpsiPakan(id: 3, name: "300 Gram"),
    OpsiPakan(id: 4, name: "400 Gram"),
  ];
  OpsiPakan selectedOption = OpsiPakan(id: 1, name: "100 Gram");

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(10),
        side: const BorderSide(
          color: ListColor.gray100,
          width: 1,
        ),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            Row(
              children: [
                TextDescriptionSmall("Jadwal pakan berikutnya pukul ${widget.nextFeedingTime}"),
              ],
            ),
            SizedBox(height: 10.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextPointSmall("${widget.beratPakan} Gr"),
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
                        // const Divider(
                        //   thickness: 0.7
                        // ),
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
                                                  selectedOption = option;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(24.w),
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
                                bottom: BorderSide(width: 1, color: ListColor.gray200),
                                top: BorderSide(width: 1, color: ListColor.gray200),
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
                                      TextDescriptionBoldGreen(selectedOption.name),
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
                        // const Divider(
                        //     thickness: 0.7
                        // ),
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
                        } else {
                          setState(() {
                            _isExpanded = true;
                          });
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8.w),
                        child: TextDescriptionSmallButton(
                            _isExpanded == true ? "Simpan" : "Edit Cepat"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
