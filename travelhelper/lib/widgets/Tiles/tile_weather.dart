import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelhelper/bloc/find_data.dart';

Widget tileWeather(LoadedState loadedState) {
  return Material(
    child: Column(
      children: [
        SizedBox(height: 16.0),
        ExpansionTile(
          title: Text(
            "Погода",
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: Colors.deepPurple.shade400,
              fontWeight: FontWeight.w500,
            ),
          ),
          children: [
            Text(loadedState.weather!.name.toString(),
                style: GoogleFonts.rubik(
                    fontSize: 20, fontWeight: FontWeight.w600, color: Colors.purple.shade300)),
            Text("${loadedState.weather!.fixTemp(loadedState.weather!.currTemp)}°C",
                style: GoogleFonts.rubik(
                    fontSize: 16, fontWeight: FontWeight.w400, color: Colors.purple.shade300)),
            Text(loadedState.weather!.weatherDescription,
                style: GoogleFonts.rubik(
                    fontSize: 16, fontWeight: FontWeight.w300, color: Colors.purple.shade300)),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    ),
  );
}
