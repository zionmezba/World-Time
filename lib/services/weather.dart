import 'package:http/http.dart';
import 'dart:convert';

class Weather {
  String weatherDescription = '';
  String temperature = '';
  String windSpeed = '';
  String locationW = '';
  String apiKey = 'a8adf65258c4afe7a3c11137e3b88f9a';

  Weather({required this.locationW});

  Future<void> getWeather() async {
    try {
      Response response = await get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$locationW&appid=$apiKey"));

      Map data = jsonDecode(response.body);
      // print(data);
      double temp = data['main']['temp'];
      temp -= 273.15;
      temperature = temp.toStringAsFixed(1);
      weatherDescription = data['weather'][0]['description'];
      weatherDescription = weatherDescription.substring(0, 1).toUpperCase() +
          weatherDescription.substring(1);
      windSpeed = data['wind']['speed'].toString();
      // print("temperature : $temperature");
    } catch (e) {
      temperature = "Unable to get Temperature Data";
      // print('error is : $e');
    }
  }
}
