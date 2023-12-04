import '../../controller/realtime_data/get_ph_temperature.dart';

class NotificationModel {
  final GetPHandTemperature _getPHandTemperature = GetPHandTemperature();
  late final Stream<double> _phStream;
  late final Stream<double> _temperatureStream;
  final Function(String) onMessagePHUpdate;
  final Function(String) onMessageSuhuUpdate;

  NotificationModel({required this.onMessagePHUpdate, required this.onMessageSuhuUpdate}) {
    _phStream = _getPHandTemperature.getPHStream();
    _phStream.listen(_handlePHChange);

    _temperatureStream = _getPHandTemperature.getTemperatureStream();
    _temperatureStream.listen(_handleTemperatureChange);
  }

  void _handlePHChange(double ph) {
    String message;
    if (ph > 8) {
      message = "Terlalu tinggi";
    } else if (ph >= 5 && ph <= 7) {
      message = "Kondisi baik";
    } else {
      message = "Terlalu rendah";
    }
    onMessagePHUpdate(message);
  }

  void _handleTemperatureChange(double temperature) {
    String message;
    if (temperature > 31.0) {
      message = "Terlalu tinggi";
    } else if (temperature >= 26.0 && temperature <= 30.0) {
      message = "Kondisi baik";
    } else {
      message = "Terlalu rendah";
    }
    onMessageSuhuUpdate(message);
  }

// ... tambahkan fungsi atau logika lainnya sesuai kebutuhan
}
