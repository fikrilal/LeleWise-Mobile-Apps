import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class PakanDataHelper {
  static final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child('konfigurasi_pakan/konfigurasi_pakan');

  static Future<List<Map<String, dynamic>>> getDataPakan() async {
    DatabaseEvent event = await _databaseReference.once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      if (snapshot.value is List<Object?>) {
        List<Object?> dataList = snapshot.value as List<Object?>;
        List<Map<String, dynamic>> formattedDataList = [];

        for (var data in dataList) {
          if (data is Map<dynamic, dynamic>) {
            String key = data['_key'].toString();
            String pengulangan = data['pengulangan'].toString();
            String beratPakan = data['berat_pakan'].toString();
            String waktuPakan = data['waktu_pakan'].toString();

            formattedDataList.add({
              '_key': key,
              'pengulangan': pengulangan,
              'berat_pakan': beratPakan,
              'waktu_pakan': waktuPakan,
            });
          }
        }
        formattedDataList.sort((a, b) => DateFormat('HH:mm').parse(a['waktu_pakan']).compareTo(DateFormat('HH:mm').parse(b['waktu_pakan'])));
        return formattedDataList;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getDataPakanNoFilter() async {
    DatabaseEvent event = await _databaseReference.once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      if (snapshot.value is List<Object?>) {
        List<Object?> dataListNoFilter = snapshot.value as List<Object?>;
        List<Map<String, dynamic>> formattedDataListNoFilter = [];

        for (var data in dataListNoFilter) {
          if (data is Map<dynamic, dynamic>) {
            String keyNoFilter = data['_key'].toString();
            String pengulanganNoFilter = data['pengulangan'].toString();
            String beratPakanNoFilter = data['berat_pakan'].toString();
            String waktuPakanNoFilter = data['waktu_pakan'].toString();

            formattedDataListNoFilter.add({
              '_key': keyNoFilter,
              'pengulangan': pengulanganNoFilter,
              'berat_pakan': beratPakanNoFilter,
              'waktu_pakan': waktuPakanNoFilter,
            });
          }
        }
        return formattedDataListNoFilter;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }


  static Future<List<Map<String, String>>> fetchRiwayatPakanData() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('riwayat_pakan');
    DatabaseEvent event = await ref.once();
    List<Map<String, dynamic>> dataList = [];

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> values = Map.from(event.snapshot.value as Map);
      values.forEach((key, value) {
        dataList.add({
          "name": "${value['berat_pakan']} Gr",
          "date": "${value['tanggal']} • ${value['waktu_pakan']}",
          "dateTime": _parseDateTime(value['tanggal'], value['waktu_pakan'])
        });
      });
    }

    dataList.sort((a, b) => b['dateTime'].compareTo(a['dateTime']));
    return dataList.map<Map<String, String>>((data) {
      return {
        "name": data['name'] as String,
        "date": data['date'] as String
      };
    }).toList();
  }

  static DateTime _parseDateTime(String date, String time) {
    try {
      DateFormat format = DateFormat("dd-MM-yyyy H:m");
      return format.parse("$date $time");
    } catch (e) {
      return DateTime(0);
    }
  }

}
