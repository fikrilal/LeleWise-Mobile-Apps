import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';

class TimePickerLele extends StatefulWidget {
  Function(int, int, int)? onTimeSelected;
  TimePickerLele({this.onTimeSelected});

  @override
  State<TimePickerLele> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePickerLele> {
  int _selectedHour = DateTime.now().hour % 12;
  int _selectedMinute = DateTime.now().minute;
  int _selectedPeriod = DateTime.now().hour >= 12 ? 1 : 0; // 0 for AM, 1 for PM

  final List<String> _hours =
      List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'));
  final List<String> _minutes =
      List.generate(60, (index) => index.toString().padLeft(2, '0'));
  final List<String> _periods = ['AM', 'PM'];

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
                // widget.onTimeSelected!(
                //     _selectedPeriod, _selectedMinute, _selectedPeriod);
              });
            }),
            _buildPicker(_hours, _selectedHour, (int index) {
              setState(() {
                _selectedHour = index;

                // widget.onTimeSelected!(
                //     _selectedPeriod, _selectedMinute, _selectedPeriod);
              });
            }),
            _buildPicker(_minutes, _selectedMinute, (int index) {
              setState(() {
                _selectedMinute = index;
                // widget.onTimeSelected!(
                //     _selectedPeriod, _selectedMinute, _selectedPeriod);
              });
              ;
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
                  child: TextDescription(item,
                      fontSize: selectedIndex == options.indexOf(item)
                          ? 45.sp
                          : 34.sp,
                      textcolor: selectedIndex == options.indexOf(item)
                          ? Colors.black
                          : Colors.grey),
                )))
            .toList(),
      ),
    );
  }
}
