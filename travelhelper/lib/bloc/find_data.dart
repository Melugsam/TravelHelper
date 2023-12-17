// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelhelper/models/attraction_info.dart';
import 'package:travelhelper/models/city_info.dart';
import 'package:travelhelper/models/hotel_info.dart';
import 'package:travelhelper/models/weather_info.dart';
import 'package:travelhelper/services/WorldApi/city_request.dart';
import 'package:travelhelper/services/WorldApi/hotels_request.dart';
import 'package:travelhelper/services/attractions_request.dart';
import 'package:travelhelper/services/weather_request.dart';

// События BLoC
abstract class TravelEvent {}

class SearchEvent extends TravelEvent {
  final String cityName;
  final double radius;

  SearchEvent(this.cityName, this.radius);
}

// Состояния BLoC
abstract class TravelState {}

class InitialState extends TravelState {}

class LoadingState extends TravelState {}

class LoadedState extends TravelState {
  CityClass? cityInfo;
  List<HotelInfo?>? hotels;
  WeatherData? weather;
   List<AttractionInfo?>? attractions;
  LoadedState({
    this.cityInfo,
    this.hotels,
    this.weather,
    this.attractions,
  });
}

class ErrorState extends TravelState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}

// BLoC
class TravelBloc extends Bloc<TravelEvent, TravelState> {
  TravelBloc() : super(InitialState()) {
    on<SearchEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final String cityName = event.cityName;
        final double radius = event.radius;

        CityClass? cityInfo = await fetchCityData(cityName);
        List<HotelInfo?>? hotels = await fetchHotelsData(cityInfo!.locationId);
        WeatherData? weather = await getWeatherData(cityName);
        List<AttractionInfo?>? attractions = await fetchAttractions(cityInfo.latitude, cityInfo.longitude, radius);

        emit(LoadedState(cityInfo: cityInfo, hotels: hotels, weather: weather, attractions: attractions));
      } catch (e) {
        // Обработка ошибок
        emit(ErrorState("Произошла ошибка поиска"));
      }
    });
  }
}


