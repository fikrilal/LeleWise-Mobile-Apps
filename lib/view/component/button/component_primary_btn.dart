import 'package:flutter/material.dart';

Widget primaryButton({
  required String text,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xff0A9830), // Warna latar belakang tombol
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(60),
      ),
      minimumSize: Size(double.infinity, 0), // Lebar mengikuti parent
      padding: const EdgeInsets.symmetric(
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