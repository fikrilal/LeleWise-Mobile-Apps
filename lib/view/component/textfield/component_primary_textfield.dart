import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';

Widget PrimaryTextfield(
    String text,
    String svgIconPath,
    bool isPasswordType,
    TextEditingController controller,
    double iconWidth,
    double iconHeight,
    Color iconColor) {
  return TextFormField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: ListColor.primary,
    style: const TextStyle(
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: ListColor.gray700, // Warna teks dalam TextField
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60),
        borderSide: const BorderSide(
          color: ListColor.gray200,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60),
        borderSide: const BorderSide(
          color: ListColor.primary,
          width: 1,
        ),
      ),
      prefixIcon: SizedBox(
        width: iconWidth,
        height: iconHeight,
        child: SvgPicture.asset(
          svgIconPath, // Gunakan path file SVG custom
          color: iconColor,
        ),
      ),
      labelText: text,
      labelStyle: const TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: ListColor.gray500,
      ),
      filled: false,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
