import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  final Color? color;
  final Color? selectColor;
  final void Function(int?)? onChanged;

  CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    this.color = Colors.transparent,
    this.selectColor = ListColor.primary,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged?.call(widget.value);
      },
      child: GestureDetector(
        onTap: () {
          bool selected = widget.value != widget.groupValue;
          if(selected) {
            widget.onChanged!(widget.value);
          }
        },
        child: SvgPicture.asset(
          'assets/icons/tick.svg',
          color: widget.value == widget.groupValue ? widget.selectColor : widget.color,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
