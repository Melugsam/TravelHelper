import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget ErrorRequest() {
  return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Ошибка поиска\nПопробуйте изменить входные данные",
            style: GoogleFonts.rubik(
            fontSize: 16, decoration: TextDecoration.none, color: Colors.red),
          ),
        ],
      ));
}
