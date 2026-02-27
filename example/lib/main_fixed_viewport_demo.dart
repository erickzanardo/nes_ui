import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final baseThemeData = flutterNesTheme(nesTheme: const NesTheme(pixelSize: 1));

  final themeData = baseThemeData.copyWith(
    textTheme: baseThemeData.textTheme.copyWith(
      bodyLarge: baseThemeData.textTheme.bodyLarge?.copyWith(fontSize: 8),
      bodyMedium: baseThemeData.textTheme.bodyMedium?.copyWith(fontSize: 6),
      bodySmall: baseThemeData.textTheme.bodySmall?.copyWith(fontSize: 4),
      labelLarge: baseThemeData.textTheme.labelLarge?.copyWith(fontSize: 8),
      labelMedium: baseThemeData.textTheme.labelMedium?.copyWith(fontSize: 6),
      labelSmall: baseThemeData.textTheme.labelSmall?.copyWith(fontSize: 4),
      displayLarge: baseThemeData.textTheme.displayLarge?.copyWith(fontSize: 8),
      displayMedium: baseThemeData.textTheme.displayMedium?.copyWith(
        fontSize: 6,
      ),
      displaySmall: baseThemeData.textTheme.displaySmall?.copyWith(fontSize: 4),
    ),
    extensions: [
      ...baseThemeData.extensions.values,
      NesContainerTheme(
        backgroundColor: const Color(0xFFFFFFFF),
        borderColor: const Color(0xFF000000),
        padding: const EdgeInsets.all(4),
        labelTextStyle: baseThemeData.textTheme.labelSmall ?? const TextStyle(),
      ),
    ],
  );
  runApp(MaterialApp(theme: themeData, home: const FixedViewportPage()));
}

class FixedViewportPage extends StatefulWidget {
  const FixedViewportPage({super.key});

  @override
  State createState() => _FixedViewportPageState();
}

class _FixedViewportPageState extends State<FixedViewportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: NesFixedViewport(
          builder: (context) => DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyMedium ?? const TextStyle(),
            child: NesContainer(
              width: 256,
              height: 240,
              child: Column(
                children: [
                  const Text(
                    'This content has a fixed viewport of 256x240 (the '
                    'original resolution of the NES). ',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const NesContainer(child: Text('Hello World')),
                  const SizedBox(height: 4),
                  NesButton(
                    type: NesButtonType.primary,
                    onPressed: () {
                      NesDialog.show<void>(
                        context: context,
                        builder: (_) => Column(
                          children: [
                            const Text('Hello, World!'),
                            const SizedBox(height: 16),
                            NesButton(
                              type: NesButtonType.primary,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Thanks, bye!'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Say Hello'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
