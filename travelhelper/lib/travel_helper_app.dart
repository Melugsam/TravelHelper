import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';  

class TravelHelperApp extends StatelessWidget {
  const TravelHelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            RotateAnimatedText('Travel Helper', textStyle: GoogleFonts.robotoSlab(color: Colors.deepPurple.shade600, fontSize: 30.0, decoration: TextDecoration.none)),
            RotateAnimatedText('Travel Helper', textStyle: GoogleFonts.rubik(color: Colors.deepPurple.shade600, fontSize: 30.0, decoration: TextDecoration.none)),
            RotateAnimatedText('Travel Helper', textStyle: GoogleFonts.playfairDisplay(color: Colors.deepPurple.shade600, fontSize: 30.0, decoration: TextDecoration.none)),
          ],
          
          isRepeatingAnimation: true,
          repeatForever: true,
        )
      ],
    );
  }
}
