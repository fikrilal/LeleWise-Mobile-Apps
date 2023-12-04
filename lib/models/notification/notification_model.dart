import '../../controller/realtime_data/get_ph_temperature.dart';

class NotificationModel {
  final GetPHandTemperature _getPHandTemperature = GetPHandTemperature();
  late final Stream<double> _phStream;
  late final Stream<double> _temperatureStream;
  final Function(String) onMessagePHUpdate;
  final Function(String) onMessageSuhuUpdate;
  final Function(String) onUniversalMessageUpdate;

  String _phCondition = "unknown";
  String _suhuCondition = "unknown";

  NotificationModel({required this.onMessagePHUpdate, required this.onMessageSuhuUpdate, required this.onUniversalMessageUpdate}) {
    _phStream = _getPHandTemperature.getPHStream();
    _phStream.listen(handlePHChange);
    _temperatureStream = _getPHandTemperature.getTemperatureStream();
    _temperatureStream.listen(handleTemperatureChange);
  }

  void handlePHChange(double ph) {
    String message;
    if (ph > 8) {
      message = "Terlalu tinggi";
      _phCondition = "high";
    } else if (ph >= 5 && ph <= 7) {
      message = "Kondisi baik";
      _phCondition = "good";
    } else {
      message = "Terlalu rendah";
      _phCondition = "low";
    }
    onMessagePHUpdate(message);
    evaluateConditions();
  }

  void handleTemperatureChange(double temperature) {
    String message;
    if (temperature > 31.0) {
      message = "Terlalu tinggi";
      _suhuCondition = "high";
    } else if (temperature >= 26.0 && temperature <= 30.0) {
      message = "Kondisi baik";
      _suhuCondition = "good";
    } else {
      message = "Terlalu rendah";
      _suhuCondition = "low";
    }
    onMessageSuhuUpdate(message);
    evaluateConditions();
  }

  void evaluateConditions() {
    String universalMessage;
    if (_phCondition == "high" && _suhuCondition == "high") {
      universalMessage = "PH dan suhu air kolam kamu terlalu tinggi!";
    } else if (_phCondition == "high" && _suhuCondition == "good") {
      universalMessage = "PH air kolam kamu terlalu tinggi!";
    } else if (_phCondition == "high" && _suhuCondition == "low") {
      universalMessage = "PH terlalu tinggi & suhu terlalu rendah!";
    } else if (_phCondition == "good" && _suhuCondition == "high") {
      universalMessage = "Suhu air kolam kamu terlalu tinggi!";
    } else if (_phCondition == "good" && _suhuCondition == "good") {
      universalMessage = "Kolam lele kamu dalam keadaan baik!";
    } else if (_phCondition == "good" && _suhuCondition == "low") {
      universalMessage = "Suhu air kolam kamu terlalu rendah!";
    } else if (_phCondition == "low" && _suhuCondition == "high") {
      universalMessage = "PH terlalu rendah & suhu terlalu tinggi!";
    } else if (_phCondition == "low" && _suhuCondition == "good") {
      universalMessage = "PH air kolam kamu terlalu rendah";
    } else if (_phCondition == "low" && _suhuCondition == "low") {
      universalMessage = "PH dan suhu air kolam kamu terlalu rendah!";
    } else {
      universalMessage = "Kamu perlu memeriksa keadaan kolam!";
    }
    onUniversalMessageUpdate(universalMessage);
  }
}
