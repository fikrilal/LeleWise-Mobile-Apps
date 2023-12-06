import 'package:firebase_database/firebase_database.dart';

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
    }
    return histories;
  }
}