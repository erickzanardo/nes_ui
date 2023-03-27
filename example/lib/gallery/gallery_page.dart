import 'package:example/gallery/gallery.dart';
import 'package:example/widgets/widgets.dart';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NesScaffold(
      child: SingleChildScrollView(
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
              const Divider(),
              const SizedBox(height: 32),
              const TextSection(),
              const SizedBox(height: 32),
              const FileExplorerSection(),
              const SizedBox(height: 32),
              const ScreenTransitionsSection(),
              const SizedBox(height: 32),
              const DialogsSection(),
              const SizedBox(height: 32),
              const IterableOptionsSection(),
              const SizedBox(height: 32),
              const KeyIconsSection(),
              const SizedBox(height: 32),
              const SelectionListSection(),
              const SizedBox(height: 32),
              const CheckBoxesSection(),
              const SizedBox(height: 32),
              const IconsSection(),
              const SizedBox(height: 32),
              const IconButtonsSection(),
              const SizedBox(height: 32),
              const TextFieldsSection(),
              const SizedBox(height: 32),
              const ContainersSection(),
              const SizedBox(height: 32),
              const ButtonsSection(),
              const SizedBox(height: 32),
              const CustomExtensions(),
            ],
          ),
        ),
      ),
    );
  }
}
