import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelhelper/bloc/change_screen.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 300,
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Travel Helper',
                    textStyle: GoogleFonts.robotoSlab(
                        color: Colors.deepPurple.shade600,
                        fontSize: 36,
                        decoration: TextDecoration.none)),
                RotateAnimatedText('Travel Helper',
                    textStyle: GoogleFonts.rubik(
                        color: Colors.deepPurple.shade600,
                        fontSize: 36,
                        decoration: TextDecoration.none)),
                RotateAnimatedText('Travel Helper',
                    textStyle: GoogleFonts.playfairDisplay(
                        color: Colors.deepPurple.shade600,
                        fontSize: 36,
                        decoration: TextDecoration.none)),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
          SizedBox(height: 22),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 32.0), // Задаем отступы по бокам
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                style: GoogleFonts.robotoSlab(
                  color: Theme.of(context).primaryColor,
                  fontSize: 18.0,
                  decoration: TextDecoration.none,
                ),
                children: const [
                  TextSpan(
                    text: "Привет, я - ",
                  ),
                  TextSpan(
                    text: "TravelHelper",
                    style: TextStyle(
                        color: Colors.purple, fontStyle: FontStyle.italic),
                  ),
                  TextSpan(text: ", твой надежный помощник в путешествиях!\n"),
                  TextSpan(
                    text:
                        "Я готов предоставить актуальные данные о гостиницах, прогнозе погоды и достопримечательностях по всему миру.",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 22),
          ElevatedButton(
            onPressed: () {
              context.read<ScreenBloc>().add(SwitchToTravelAppEvent());
            },
            style: ElevatedButton.styleFrom(
              minimumSize:
                  Size(200.0, 50.0), // Задаем минимальные размеры кнопки
            ),
            child: Text(
                "Начать работу",
                style: GoogleFonts.rubik(
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    color: Colors.deepPurple.shade400),
              ),
          )
        ],
      ),
    );
  }
}
