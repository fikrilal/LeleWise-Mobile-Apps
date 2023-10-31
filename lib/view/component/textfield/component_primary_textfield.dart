import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextField PrimaryTextfield(String text, IconData iconData, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: const Color(0xff0A9830),
    style: const TextStyle(
      fontFamily: 'Satoshi',
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Color(0xFF374151), // Warna teks dalam TextField
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(
          top: 20.0, right: 12.0, bottom: 20.0, left: 30.0),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60),
        borderSide: const BorderSide(
          color: Color(0xffE5E7EB),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60),
        borderSide: const BorderSide(
          color: Color(0xff0A9830),
          width: 1,
        ),
      ),
      prefixIcon: SizedBox(
          width: 24, // Atur lebar ikon sesuai keinginan Anda
          child: SvgPicture.asset(
            "assets/icons/email_icon.svg",
            colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
          )),
      labelText: text,
      labelStyle: const TextStyle(
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Color(0xff6B7280),
      ),
      filled: false,
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
