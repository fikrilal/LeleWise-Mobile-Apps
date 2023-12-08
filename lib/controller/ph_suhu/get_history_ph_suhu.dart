import 'package:firebase_database/firebase_database.dart';

class PHAndTemperatureHistory {
  final double ph;
  final double temperature;

  PHAndTemperatureHistory({required this.ph, required this.temperature});

  // Factory constructor to create an instance from a Map
  factory PHAndTemperatureHistory.fromMap(Map<dynamic, dynamic> value) {
    return PHAndTemperatureHistory(
      ph: value['ph']?.toDouble() ?? 0.0,  // Null check and default to 0.0
      temperature: value['temperature']?.toDouble() ?? 0.0,
    );
  }
}

class HistoryService {
  static Future<List<PHAndTemperatureHistory>> fetchPHAndTemperatureHistory() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('datariwayat');
    DatabaseEvent event = await ref.once();

    List<PHAndTemperatureHistory> histories = [];
    if (event.snapshot.value != null) {
      Map<dynamic, dynamic> values = Map.from(event.snapshot.value as Map);
      values.forEach((key, value) {
        histories.add(PHAndTemperatureHistory.fromMap(value));
      });
    }
    return histories;
  }
}
