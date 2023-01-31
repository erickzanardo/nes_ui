import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rpg_menu_state.dart';

class RpgMenuCubit extends Cubit<RpgMenuState> {
  RpgMenuCubit() : super(const RpgMenuState());
}
