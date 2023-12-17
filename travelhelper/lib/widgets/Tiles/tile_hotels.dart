import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelhelper/bloc/find_data.dart';

Widget tileHotels(LoadedState loadedState) {
  return Material(
    child: Column(
      children: [
        SizedBox(height: 16.0),
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
                      Text(
                        "Отель: ${hotel?.name ?? ""}",
                        style: GoogleFonts.rubik(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.purple.shade300,
                        ),
                      ),
                      Text(
                        "Местоположение: ${hotel?.locationString ?? ""}",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 16.0),
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
