class AttractionInfo {
  late String name;
  late int rate;
  late double lat;
  late double lon;
  late List<String> kinds;

  AttractionInfo(this.name, this.rate, this.lat, this.lon, this.kinds);

  @override
  String toString() {
    return 'Name: $name, Rate: $rate, Latitude: $lat, Longitude: $lon, Kinds: $kinds';
  }
}