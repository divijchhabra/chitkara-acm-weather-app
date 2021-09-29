import 'package:clima/models/location.dart';
import 'package:http/http.dart' as http;
import 'package:clima/constants.dart';
import 'dart:convert';

class WeatherModel {
  getLocationWeather() async {
    Location location = Location();
    await location.getLocation();
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$myApiKey'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }

  getCityWeather(String city) async {
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&units=metric&appid=$myApiKey'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
  }
}
