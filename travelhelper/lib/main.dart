import 'package:flutter/material.dart';
import 'package:travelhelper/travel_helper_app.dart';
void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: TravelHelperApp(),
      ),
    );
  }
}
