import 'package:travelhelper/models/attraction_info.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<AttractionInfo?>?> fetchAttractions(
    double latitude, double longitude, double radius) async {
  List<AttractionInfo> result = [];
  final response = await http.get(
    Uri.parse(
        'https://opentripmap-places-v1.p.rapidapi.com/ru/places/radius?radius=$radius&lon=$longitude&lat=$latitude'),
    headers: {
      'X-RapidAPI-Key': '',
      'X-RapidAPI-Host': 'opentripmap-places-v1.p.rapidapi.com',
    },
  );

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse['features'] != null) {
      for (var item in jsonResponse['features']) {
        String name = item['properties']['name'];
        if (name != "") {
          int rate = item['properties']['rate'].toInt();
          double lat = item['geometry']['coordinates'][1].toDouble();
          double lon = item['geometry']['coordinates'][0].toDouble();
          List<String> kinds = item['properties']['kinds'].split(',');
          result.add(AttractionInfo(name, rate, lat, lon, kinds));
        }
      }
    } else {
      throw Exception('No data in features');
    }
    return result;
  } else {
    throw Exception('Request failed with status: ${response.statusCode}');
  }
}
