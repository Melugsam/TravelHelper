import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelhelper/bloc/find_data.dart';

Widget tileHotels(LoadedState loadedState) {
  return Material(
    child: Column(
      children: [
        ExpansionTile(
          title: Text(
            "Отели",
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: Colors.deepPurple.shade400,
              fontWeight: FontWeight.w500,
            ),
          ),
          children: [
            Container(
              height: 200, // Установите желаемую высоту для прокрутки
              child: ListView.builder(
                itemCount: loadedState.hotels!.length,
                itemBuilder: (context, index) {
                  var hotel = loadedState.hotels![index];
                  return Column(
                    children: [
                      SizedBox(height: 8.0),
                      Text(
                        textAlign: TextAlign.center,
                        "Отель: ${hotel?.name ?? ""}",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple.shade300,
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "Местоположение: ${hotel?.locationString ?? ""}",
                        style: TextStyle(fontSize: 14, color: Colors.purple.shade300),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
