import 'package:bloc/bloc.dart';

// События
abstract class ScreenEvent {}

class SwitchToWelcomeEvent extends ScreenEvent {}

class SwitchToTravelAppEvent extends ScreenEvent {}

// Состояния
abstract class ScreenState {}

class SwitchToWelcomeState extends ScreenState {}

class SwitchToTravelAppState extends ScreenState {}

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc() : super(SwitchToWelcomeState()) {
    on<SwitchToTravelAppEvent>((event, emit) {
      emit(SwitchToTravelAppState());
    });
  }
}
