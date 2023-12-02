import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUploadService {
  Future<void> uploadImage(XFile? pickedFile, BuildContext context) async {
    try {
      Dio dio = Dio();

      if (pickedFile != null) {
        FormData formData = FormData.fromMap({
          'gambarInput': await MultipartFile.fromFile(pickedFile.path, filename: 'image.jpg'),
        });

        Response response = await dio.post(
          'https://lelewise.pythonanywhere.com/',
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
    } catch (error) {
      print("Error saat upload: $error");
    }
  }
}