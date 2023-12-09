import 'package:flutter/material.dart';
import 'welcome.dart';
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
        child: Scaffold(body: Welcome()),
      ),
    );
  }
}
