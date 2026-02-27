import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState(lightMode: true));

  void toogleLightMode() {
    emit(state.copyWith(lightMode: !state.lightMode));
  }
}
