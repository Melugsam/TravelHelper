class CityInfo {
  late String name;
  late double lat;
  late double lon;

  CityInfo(this.name, this.lat, this.lon);

  @override
  String toString() {
    return 'City: $name, Latitude: $lat, Longitude: $lon';
  }
}