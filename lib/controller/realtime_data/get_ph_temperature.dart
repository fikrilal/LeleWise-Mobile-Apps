import 'package:firebase_database/firebase_database.dart';

class GetPHandTemperature {
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  Future<Map<String, dynamic>> getDataFromFirebase() async {
    DatabaseEvent databaseEvent = await _databaseReference.child('datafirebase').once();
    DataSnapshot dataSnapshot = databaseEvent.snapshot;

    if (dataSnapshot.value != null && dataSnapshot.value is Map) {
      Map<String, dynamic> data = Map<String, dynamic>.from(dataSnapshot.value as Map);
      return data;
    } else {
      return {};
    }
  }

  Future<String> getDay() async {
    Map<String, dynamic> data = await getDataFromFirebase();
    return data['day'] ?? "";
  }

  Future<String> getHour() async {
    Map<String, dynamic> data = await getDataFromFirebase();
    return data['hour'] ?? "";
  }

  Future<String> getMonth() async {
    Map<String, dynamic> data = await getDataFromFirebase();
    return data['month'] ?? "";
  }

  Future<double> getPH() async {
    Map<String, dynamic> data = await getDataFromFirebase();
    return data['ph'] ?? "";
  }

  Future<String> getStatusKondisi() async {
    Map<String, dynamic> data = await getDataFromFirebase();
    return data['status_kondisi'] ?? "";
  }

  Future<int> getTemperature() async {
    Map<String, dynamic> data = await getDataFromFirebase();
    return data['temperature'] ?? "";
  }

  Future<String> getYear() async {
    Map<String, dynamic> data = await getDataFromFirebase();
    return data['year'] ?? "";
  }
}
