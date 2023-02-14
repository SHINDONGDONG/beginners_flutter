
import 'package:beginners_flutter/cubit/app_cubit_states.dart';
import 'package:bloc/bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits(): super(InitialState()) {
    emit(WelcomeState());
  }
}