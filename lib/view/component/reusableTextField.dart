import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextField reusableTextField(String text, IconData iconData, bool isPasswordType,
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
        child: Icon(
          iconData, // Gunakan ikon bawaan Flutter
          color: const Color.fromARGB(255, 0, 76, 227),
          size: 24,
        ),
      ),
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

Widget reusableButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      primary: const Color(0xff0A9830), // Warna latar belakang tombol
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      minimumSize: Size(double.infinity, 0), // Lebar mengikuti parent
      padding: EdgeInsets.symmetric(
          vertical: 16), // Padding atas dan bawah sebesar 16
      elevation: 0, // Menghilangkan shadow
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Satoshi',
        fontWeight: FontWeight.w600, // Warna teks pada tombol
      ),
    ),
  );
}
