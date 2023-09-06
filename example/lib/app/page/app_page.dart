import 'package:example/app/app.dart';
import 'package:example/gallery/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';

class CustomExampleExtension extends ThemeExtension<CustomExampleExtension> {
  const CustomExampleExtension({
    required this.card,
  });

  final Color? card;

  @override
  ThemeExtension<CustomExampleExtension> copyWith({
    Color? card,
  }) {
    return CustomExampleExtension(
      card: card ?? this.card,
    );
  }

  @override
  ThemeExtension<CustomExampleExtension> lerp(
    covariant ThemeExtension<CustomExampleExtension>? other,
    double t,
  ) {
    if (other is! CustomExampleExtension) {
      return this;
    }
    return CustomExampleExtension(
      card: Color.lerp(card, other.card, t),
    );
  }

  static const light = CustomExampleExtension(
    card: Color(0XFF3F008C),
  );
}

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp(
            theme: flutterNesTheme(
              nesButtonTheme: NesButtonTheme(
                normal: Colors.white,
                primary: Colors.blue.shade900,
                success: Colors.green.shade900,
                warning: Colors.yellow.shade900,
                error: Colors.red.shade900,
                lightLabelColor: Colors.white,
                darkLabelColor: Colors.black,
              ),
              brightness: state.lightMode ? Brightness.light : Brightness.dark,
              customExtensions: [
                CustomExampleExtension.light,
              ],
            ),
            home: const GalleryPage(),
          );
        },
      ),
    );
  }
}
