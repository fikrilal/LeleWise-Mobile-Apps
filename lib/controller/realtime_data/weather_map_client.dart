import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lelewise_mobile_apps/controller/realtime_data/get_weather_data.dart';
import 'package:location/location.dart';
import 'package:lelewise_mobile_apps/repository/api/api_key.dart';

class OpenWeatherMapClient {
  Future<WeatherData> getWeather(LocationData locationData) async {
    if (locationData.latitude != null && locationData.longitude != null) {
      final res = await http.get(Uri.parse('$openWeatherEndPoint/weather?lat=${locationData.latitude}&lon=${locationData.longitude}&units=metric&appid=$openWeatherApiKey'));
      if (res.statusCode == 200) {
        return WeatherData.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Bad request');
      }
    } else {
      throw Exception('Wrong location');
    }
  }
}