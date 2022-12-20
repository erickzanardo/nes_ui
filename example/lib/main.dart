import 'package:example/sections/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nes/flutter_nes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: flutterNesTheme(),
      home: Scaffold(
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
                const ContainersSection(),
                const SizedBox(height: 32),
                const ButtonsSection(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
