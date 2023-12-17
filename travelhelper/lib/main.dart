import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelhelper/ui/travel_helper_app.dart';
import 'ui/welcome_page.dart';
import 'bloc/change_screen.dart';

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
      home: BlocProvider(
        create: (context) => ScreenBloc(),
        child: BlocBuilder<ScreenBloc, ScreenState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                body: buildBody(state),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildBody(ScreenState state) {
    if (state is SwitchToWelcomeState) {
      return WelcomePage();
    } else if (state is SwitchToTravelAppState) {
      return TravelHelperApp();
    }
    return Container();
  }
}
