import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travelhelper/models/hotel_info.dart';

Future<List<HotelInfo?>?> fetchHotelsData(String locationId) async {
  List<HotelInfo?> res = [];
  const String url = 'https://worldwide-hotels.p.rapidapi.com/search';
  const String apiKey = 'bf4425dea0msh8ce760c3fd4b9a5p105e4fjsn3ebf4a959132';
  const String host = 'worldwide-hotels.p.rapidapi.com';

  final Map<String, String> headers = {
    'content-type': 'application/x-www-form-urlencoded',
    'X-RapidAPI-Key': apiKey,
    'X-RapidAPI-Host': host,
  };

  final String data =
      'location_id=$locationId&language=ru_RU&currency=USD&offset=0';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: data,
    );

    if (response.statusCode == 200) {
      var jsonResult = json.decode(response.body);
      for (var entry in jsonResult['results']['data']) {
        String name = entry['name'];
        String locationString = entry['location_string'];

        // Создание объекта HotelInfo
        res.add(HotelInfo(name: name, locationString: locationString));
      }
      return res;
    }
  } catch (e) {
    print('Error: $e');
  }
  return null;
}

void main() {
  stdout.write('Введите location_id: ');
  String locationId = stdin.readLineSync() ?? '';

  fetchHotelsData(locationId);
}
