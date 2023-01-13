import 'package:example/sections/checkboxes.dart';
import 'package:example/sections/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nes/flutter_nes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Gallery());
}

class Gallery extends StatefulWidget {
  const Gallery({
    super.key,
  });

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool _lightMode = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: flutterNesTheme(
        brightness: _lightMode ? Brightness.light : Brightness.dark,
      ),
      home: Scaffold(
        floatingActionButton: NesButton(
          type: NesButtonType.normal,
          onPressed: () {
            setState(() => _lightMode = !_lightMode);
          },
          child: _lightMode
              ? NesIcon(iconData: NesIcons.instance.sun)
              : NesIcon(iconData: NesIcons.instance.moon),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/logo.png'),
                      Builder(
                        builder: (context) {
                          return Text(
                            'Flutter Nes',
                            style: Theme.of(context).textTheme.headlineMedium,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // TODO make a NES Divider
                const Divider(height: 4, color: Colors.black),
                const SizedBox(height: 32),
                const TextSection(),
                const SizedBox(height: 32),
                const CheckBoxesSection(),
                const SizedBox(height: 32),
                const IconsSection(),
                const SizedBox(height: 32),
                const TextFieldsSection(),
                const SizedBox(height: 32),
                const ContainersSection(),
                const SizedBox(height: 32),
                const ButtonsSection(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
