part of 'rpg_menu_cubit.dart';

enum Category {
  items,
  magic,
  weapon,
  armor,
  status,
}

enum Char {
  dash,
  ember,
  hank,
}

class RpgMenuState extends Equatable {
  const RpgMenuState({
    this.category,
    this.char,
  });

  final Category? category;
  final Char? char;

  @override
  List<Object?> get props => [
        category,
        char,
      ];
}
