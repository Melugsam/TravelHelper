import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelhelper/bloc/find_data.dart';
import 'package:travelhelper/widgets/error_request.dart';
import 'package:travelhelper/widgets/requests_tiles.dart';

class TravelHelperApp extends StatefulWidget {
  const TravelHelperApp({Key? key}) : super(key: key);

  @override
  _TravelHelperAppState createState() => _TravelHelperAppState();
}

class _TravelHelperAppState extends State<TravelHelperApp> {
  final TextEditingController cityNameController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TravelBloc(),
      child: BlocBuilder<TravelBloc, TravelState>(
        builder: (context, state) {
          return Material(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Поиск",
                      style: GoogleFonts.rubik(
                          fontSize: 24,
                          decoration: TextDecoration.none,
                          color: Colors.deepPurple.shade600),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "Введите название города и радиус поиска для получения данных (радиус в метрах, по умолчанию 2000)",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          decoration: TextDecoration.none,
                          color: Colors.deepPurple.shade400),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    TextField(
                      controller: cityNameController,
                      decoration: const InputDecoration(
                        labelText: 'Название города',
                        prefixIcon: Icon(Icons.text_fields),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: radiusController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: const InputDecoration(
                        labelText: 'Радиус поиска достопримечательностей',
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        final String cityName = cityNameController.text;
                        final double radius =
                            double.tryParse(radiusController.text) ?? 2000.0;
                        handleSearch(cityName, radius);
                        BlocProvider.of<TravelBloc>(context)
                            .add(SearchEvent(cityName, radius));
                      },
                      child: Text(
                        "Получить информацию",
                        style: GoogleFonts.rubik(
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            color: Colors.deepPurple.shade400),
                      ),
                    ),
                    SizedBox(height: 32.0),
                    if (state is LoadingState) // Добавленное условие
                      CircularProgressIndicator(),
                    if (state is LoadedState) RequestsTiles(state),
                    if (state is ErrorState)
                      ErrorRequest(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void handleSearch(String cityName, double radius) {
    print('Название города: $cityName, Радиус: $radius');
  }
}
