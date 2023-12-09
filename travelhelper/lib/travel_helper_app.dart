import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelHelperApp extends StatelessWidget {
  const TravelHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "123",
            style: GoogleFonts.rubik(
                fontSize: 30,
                decoration: TextDecoration.none,
                color: Colors.deepPurple.shade600),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Введите текст',
              hintText: 'Текст по умолчанию',
              prefixIcon: Icon(Icons.text_fields),
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              // Обработчик изменения текста
              print('Текущий текст в поле ввода: $value');
            },
          ),
        ],
      ),
    );
  }
}
