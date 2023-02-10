import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rpg_menu_state.dart';

class RpgMenuCubit extends Cubit<RpgMenuState> {
  RpgMenuCubit() : super(const RpgMenuState());

  void reset() {
    emit(const RpgMenuState());
  }

  void selectCategory(Category category) {
    emit(
      RpgMenuState(
        category: category,
        char: state.char,
      ),
    );
  }

  void selectChar(Char char) {
    emit(
      RpgMenuState(
        category: state.category,
        char: char,
      ),
    );
  }
}
