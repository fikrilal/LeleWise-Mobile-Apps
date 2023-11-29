import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';

class TimePickerLeleNormal extends StatefulWidget {
  Function(int, int, int)? onTimeSelected;
  TimePickerLeleNormal({this.onTimeSelected});

  @override
  State<TimePickerLeleNormal> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePickerLeleNormal> {
  late int _selectedHour;
  late int _selectedMinute;
  late int _selectedPeriod;
  late List<String> _hours;
  late List<String> _minutes;
  late List<String> _periods;

  @override
  void initState() {
    super.initState();
    _initializeTime();
  }

  void _initializeTime() {
    DateTime currentTime = DateTime.now();
    _selectedHour = currentTime.hour % 12 == 0 ? 12 : currentTime.hour % 12;
    _selectedPeriod = currentTime.hour >= 12 ? 1 : 0; // 0 for AM, 1 for PM
    _selectedMinute = currentTime.minute;

    _hours = List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));
    _minutes = List.generate(60, (index) => index.toString().padLeft(2, '0'));
    _periods = ['AM', 'PM'];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildPicker(_periods, _selectedPeriod, (int index) {
              setState(() {
                _selectedPeriod = index;
                widget.onTimeSelected!(_selectedHour, _selectedMinute, _selectedPeriod);
              });
            }),
            _buildPicker(_hours, _selectedHour - 1, (int index) {
              setState(() {
                _selectedHour = index + 1;
                widget.onTimeSelected!(_selectedHour, _selectedMinute, _selectedPeriod);
              });
            }),
            _buildPicker(_minutes, _selectedMinute, (int index) {
              setState(() {
                _selectedMinute = index;
                widget.onTimeSelected!(_selectedHour, _selectedMinute, _selectedPeriod);
              });
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildPicker(List<String> options, int selectedIndex,
      ValueChanged<int> onSelectedItemChanged) {
    return Container(
      width: 120.0.w,
      height: 150.0.h,
      child: CupertinoPicker(
        diameterRatio: 3,
        selectionOverlay: Container(),
        backgroundColor: Colors.transparent,
        itemExtent: 100.0,
        onSelectedItemChanged: onSelectedItemChanged,
        scrollController:
        FixedExtentScrollController(initialItem: selectedIndex),
        children: options
            .map((item) => Center(
            child: Container(
              child: TextDescriptionPicker(item,
                  fontSize: 36.sp,
                  textcolor: Colors.grey.shade800),
            )))
            .toList(),
      ),
    );
  }
}