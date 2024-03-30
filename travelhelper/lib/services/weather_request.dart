import '../models/weather_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<WeatherData> getWeatherData(String cityName) async {
  final baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final apiKey = '';
  final encodedCity = Uri.encodeComponent(cityName);
  final url = '$baseUrl?q=$encodedCity&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);

    final name = data['name'];
    final weatherDescription = data['weather'][0]['description'];
    final currTemp = data['main']['temp'];
    final minTemp = data['main']['temp_min'];
    final maxTemp = data['main']['temp_max'];
    final humidity = data['main']['humidity'];

    return WeatherData(
      name: name,
      weatherDescription: weatherDescription,
      currTemp: currTemp,
      minTemp: minTemp,
      maxTemp: maxTemp,
      humidity: humidity,
    );
  } else {
    throw Exception('Failed to fetch icon data.');
  }
}
