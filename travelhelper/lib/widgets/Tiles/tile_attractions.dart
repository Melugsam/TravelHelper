import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelhelper/bloc/find_data.dart';

Widget tileAttractions(LoadedState loadedState) {
  return Material(
    child: Column(
      children: [
        ExpansionTile(
          title: Text(
            "Достопримечательности",
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
                itemCount: loadedState.attractions?.length,
                itemBuilder: (context, index) {
                  var attraction = loadedState.attractions![index];
                  return Column(
                    children: [
                      SizedBox(height: 8.0),
                      Text(
                        textAlign: TextAlign.center,
                        "${attraction?.name ?? ""}",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.purple.shade300,
                        ),
                      ),
                       Text(
                        textAlign: TextAlign.center,
                        "Рейтинг: ${attraction?.rate ?? ""}★",
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
