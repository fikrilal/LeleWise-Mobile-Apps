import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ImageUploadService {
  Future<void> uploadImage(XFile? pickedFile, BuildContext context, VoidCallback onComplete) async {
    try {
      Dio dio = Dio();

      if (pickedFile != null) {
        // Mendapatkan waktu sekarang
        DateTime now = DateTime.now();

        // Format tanggal dan waktu sesuai dengan kebutuhan
        String formattedDateTime = DateFormat('ddMMyyyy_HHmmss').format(now);

        // Menyusun nama file sesuai dengan format
        String fileName = 'image_$formattedDateTime.jpg';

        FormData formData = FormData.fromMap({
          'gambarInput': await MultipartFile.fromFile(pickedFile.path, filename: fileName),
        });

        Response response = await dio.post(
          'https://970c-34-133-77-80.ngrok-free.app/upload',
          data: formData,
        );

        if (response.statusCode == 200) {
          print("Gambar berhasil diunggah");
          print(response.data);
          // Alihkan ke halaman HasilDeteksi
          Navigator.pushNamed(context, '/HasilDeteksi');
        } else {
          print("Gambar gagal diunggah. Error: ${response.statusCode}");
        }
      } else {
        // Handle ketika tidak ada file yang dipilih
      }
      onComplete();
    } catch (error) {
      print("Error saat upload: $error");
      onComplete();
    }
  }
}
