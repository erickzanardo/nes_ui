import 'package:example/sections/sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nes/flutter_nes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      theme: flutterNesTheme(),
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 32),
              TextSection(),
              SizedBox(height: 32),
              ContainersSection(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    ),
  );
}
