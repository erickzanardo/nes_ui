part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    required this.lightMode,
  });

  final bool lightMode;

  AppState copyWith({
    bool? lightMode,
  }) {
    return AppState(
      lightMode: lightMode ?? this.lightMode,
    );
  }

  @override
  List<Object> get props => [lightMode];
}
