import 'package:example/app/app.dart';
import 'package:example/gallery/gallery_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';

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
              brightness: state.lightMode ? Brightness.light : Brightness.dark,
            ),
            home: const GalleryPage(),
          );
        },
      ),
    );
  }
}
