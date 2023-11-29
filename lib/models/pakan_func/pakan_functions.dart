import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

String _nextFeedingTime  = "";
String _beratPakan  = "";

class PakanFunctions {
  static void getDataFromFirebaseNoFilter(
      DatabaseReference databaseReference, List<Map<String, dynamic>> dataListNoFilter,
      Function setState) {
    databaseReference.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        List<Map<dynamic, dynamic>> dataListNoFilter =
        List<Map<dynamic, dynamic>>.from(snapshot.value as List<Object?>? ?? []);
        dataListNoFilter.forEach((data) {
          String beratPakanNoFilter = data['berat_pakan'].toString();
          String waktuPakanNoFilter = data['waktu_pakan'].toString();
          dataListNoFilter.add({
            'berat_pakan': beratPakanNoFilter,
            'waktu_pakan': waktuPakanNoFilter,
          });
        });
        setState(() {});
      }
    });
  }

  static String getDataNoFilter(List<Map<String, dynamic>> dataListNoFilter, String fieldName) {
    if (dataListNoFilter.isNotEmpty) {
      return dataListNoFilter[0][fieldName] ?? "";
    } else {
      return "";
    }
  }

  static Future<void> getDataFromFirebase(
      DatabaseReference databaseReference, List<Map<String, dynamic>> dataList,
      String formattedTime, Function setState) async {
    final DateTime currentTime = DateTime.now();
    final String formattedTime = DateFormat('HH:mm').format(currentTime);

    databaseReference.once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        List<Map<dynamic, dynamic>> dataList =
        List<Map<dynamic, dynamic>>.from(snapshot.value as List<Object?>? ?? []);
        dataList.forEach((data) {
          String beratPakan = data['berat_pakan'].toString();
          String waktuPakan = data['waktu_pakan'].toString();

          if (waktuPakan.compareTo(formattedTime) > 0) {
            dataList.add({
              'berat_pakan': beratPakan,
              'waktu_pakan': waktuPakan,
            });
          }
        });

        dataList.sort((a, b) {
          return DateFormat('HH:mm').parse(a['waktu_pakan']).compareTo(DateFormat('HH:mm').parse(b['waktu_pakan']));
        });
        if (dataList.isNotEmpty) {
          setState(() {
            _nextFeedingTime = dataList[0]['waktu_pakan'];
            _beratPakan = dataList[0]['berat_pakan'];
          });
        } else {
          setState(() {
            _nextFeedingTime = "";
            _beratPakan = "";
          });
        }
      }
    });
  }

  static String getBeratPakan(String _beratPakan) {
    return _beratPakan;
  }
}
