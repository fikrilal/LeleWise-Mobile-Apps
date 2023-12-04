import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class PakanDataHelper {
  static final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference().child('konfigurasi_pakan/konfigurasi_pakan');

  static Future<List<Map<String, dynamic>>> getDataPakan() async {
    DatabaseEvent event = await _databaseReference.once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      List<Map<dynamic, dynamic>> dataList = List<Map<dynamic, dynamic>>.from(snapshot.value as List<Object?>? ?? []);
      List<Map<String, dynamic>> formattedDataList = [];
      for (var data in dataList) {
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

      formattedDataList.sort((a, b) => DateFormat('HH:mm').parse(a['waktu_pakan']).compareTo(DateFormat('HH:mm').parse(b['waktu_pakan'])));
      return formattedDataList;
    } else {
      return [];
    }
  }

  static Future<List<Map<String, dynamic>>> getDataPakanNoFilter() async {
    DatabaseEvent event = await _databaseReference.once();
    DataSnapshot snapshot = event.snapshot;

    if (snapshot.value != null) {
      List<Map<dynamic, dynamic>> dataListNoFilter = List<Map<dynamic, dynamic>>.from(snapshot.value as List<Object?>? ?? []);
      List<Map<String, dynamic>> formattedDataListNoFilter = [];
      for (var data in dataListNoFilter) {
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
      return formattedDataListNoFilter;
    } else {
      return [];
    }
  }

// Tambahkan fungsi lainnya jika diperlukan
}
