import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:travelhelper/models/city_info.dart';

Future<CityClass?> fetchCityData(String cityName) async {
  const String url = 'https://worldwide-hotels.p.rapidapi.com/typeahead';
  const String apiKey = '';
  const String host = 'worldwide-hotels.p.rapidapi.com';

  final Map<String, String> headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'X-RapidAPI-Key': apiKey,
    'X-RapidAPI-Host': host,
  };

  final Map<String, String> body = {'q': cityName, 'language': 'ru_RU'};
  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {

      // Преобразование строки в JSON
      Map<String, dynamic> jsonResult = json.decode(response.body);

      String name = jsonResult['results']['data'][0]['result_object']['name'];
      String locationId = jsonResult['results']['data'][0]['result_object']['location_id'];
      double latitude = double.parse(jsonResult['results']['data'][0]['result_object']['latitude']);
      double longitude = double.parse(jsonResult['results']['data'][0]['result_object']['longitude']);
      
      return CityClass(name: name, locationId: locationId, latitude: latitude, longitude: longitude);
    }
    else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}

void main() {
  stdout.write('Введите название города: ');
  String cityName = stdin.readLineSync() ?? '';
  print(fetchCityData(cityName));
}
