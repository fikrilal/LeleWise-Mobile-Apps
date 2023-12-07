import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class DetectionHistory {
  final String time;
  final String condition;
  final String imageName;
  final String date;

  DetectionHistory({
    required this.time,
    required this.condition,
    required this.imageName,
    required this.date,
  });

  factory DetectionHistory.fromMap(Map<dynamic, dynamic> data) {
    return DetectionHistory(
      time: data['jam'] ?? '',
      condition: data['kondisi'] ?? '',
      imageName: data['nama_gambar'] ?? '',
      date: data['tanggal'] ?? '',
    );
  }
}

class HistoryService {
  static Future<List<DetectionHistory>> fetchHistory() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('riwayat_deteksi');
    DatabaseEvent event = await ref.once();
    List<DetectionHistory> histories = [];

    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> values = Map.from(event.snapshot.value as Map);
      values.forEach((key, value) {
        histories.add(DetectionHistory.fromMap(value));
      });

      // Mengurutkan riwayat berdasarkan tanggal dan waktu
      histories.sort((a, b) {
        DateTime aDateTime = _parseDateTime(a.date, a.time);
        DateTime bDateTime = _parseDateTime(b.date, b.time);
        return bDateTime.compareTo(aDateTime); // Urutan descending
      });
    }
    return histories;
  }

  static DateTime _parseDateTime(String date, String time) {
    try {
      DateFormat format = DateFormat("dd/MM/yyyy HH:mm");
      return format.parse("$date $time");
    } catch (e) {
      // Handle parsing error
      return DateTime(0);
    }
  }
}