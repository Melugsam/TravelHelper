import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'travel_helper_app.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 200,
            child: AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Travel Helper',
                    textStyle: GoogleFonts.robotoSlab(
                        color: Colors.deepPurple.shade600,
                        fontSize: 30.0,
                        decoration: TextDecoration.none)),
                RotateAnimatedText('Travel Helper',
                    textStyle: GoogleFonts.rubik(
                        color: Colors.deepPurple.shade600,
                        fontSize: 30.0,
                        decoration: TextDecoration.none)),
                RotateAnimatedText('Travel Helper',
                    textStyle: GoogleFonts.playfairDisplay(
                        color: Colors.deepPurple.shade600,
                        fontSize: 30.0,
                        decoration: TextDecoration.none)),
              ],
              isRepeatingAnimation: true,
              repeatForever: true,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TravelHelperApp()),
                );
              },
              child: Text("Начать работу"))
        ],
      ),
    );
  }
}
