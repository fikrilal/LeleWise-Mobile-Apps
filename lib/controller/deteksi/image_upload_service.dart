import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ImageUploadResult {
  final String? penyakitMessage;
  final String? imageUrl;

  ImageUploadResult({this.penyakitMessage, this.imageUrl});
}

class ImageUploadService {

  Future<String?> getApiKey() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("api_key");
    DataSnapshot snapshot = await ref.get();
    if (snapshot.exists) {
      return snapshot.value.toString();
    } else {
      print("No data available for API key.");
      return null;
    }
  }

  Future<ImageUploadResult?> uploadImage(XFile? pickedFile, BuildContext context, VoidCallback onComplete) async {
    try {
      Dio dio = Dio();

      String? apiKey = await getApiKey(); // Fetch the API key

      if (apiKey == null) {
        print("API key is not available.");
        return null;
      }

      if (pickedFile != null) {
        DateTime now = DateTime.now();
        String formattedDateTime = DateFormat('ddMMyyyy_HHmmss').format(now);
        String fileName = 'image_$formattedDateTime.jpg';

        FormData formData = FormData.fromMap({
          'gambarInput': await MultipartFile.fromFile(pickedFile.path, filename: fileName),
        });

        Response response = await dio.post(
          apiKey,
          data: formData,
        );

        if (response.statusCode == 200) {
          print("Gambar berhasil diunggah");
          print(response.data);

          if (response.data.containsKey('penyakit')) {
            String penyakitMessage = response.data['penyakit'];
            String imageUrl = response.data['gambar'];
            print("Pesan penyakit: $penyakitMessage");
            return ImageUploadResult(penyakitMessage: penyakitMessage, imageUrl: imageUrl);
          }
          // Navigator.pushNamed(context, '/HasilDeteksi');
        } else {
          print("Gambar gagal diunggah. Error: ${response.statusCode}");
        }
      } else {
        // Handle ketika tidak ada file yang dipilih
      }
      onComplete();
      return null;
    } catch (error) {
      print("Error saat upload: $error");
      onComplete();
      return null;
    }
  }
}

