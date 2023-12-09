import 'package:bloc/bloc.dart';

abstract class ScreenEvent{}

class SwitchToWelcomeEvent extends ScreenEvent{}

class SwitchToTravelAppEvent extends ScreenEvent{}

abstract class ScreenState{}

class SwitchToWelcomeState extends ScreenState{}

class SwitchToTravelAppState extends ScreenState{}

class ScreenBloc extends Bloc<ScreenEvent,ScreenState>{
  ScreenBloc() : super(SwitchToWelcomeState());
  
}