import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelhelper/bloc/find_data.dart';
import 'package:travelhelper/widgets/Tiles/tile_attractions.dart';
import 'Tiles/tile_hotels.dart';
import 'Tiles/tile_weather.dart';

Widget RequestsTiles(LoadedState loadedState) {
  return Material(
    child: Column(children: [
      Text(
        "Название города: ${loadedState.cityInfo?.name ?? ""}",
        style: GoogleFonts.rubik(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.deepPurple.shade600,
        ),
      ),
      tileHotels(loadedState),
      tileWeather(loadedState),
      tileAttractions(loadedState)
    ]),
  );
}
