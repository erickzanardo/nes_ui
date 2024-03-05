import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_section_header}
/// An opninated section header for the NES UI.
/// Consists of a title and a [Divider]
/// {@endtemplate}
class NesSectionHeader extends StatelessWidget {
  /// {@macro nes_section_header}
  const NesSectionHeader({
    required this.title,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  });

  /// The title of the section header.
  final String title;

  /// The alignment of the section header.
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: nesTheme.pixelSize * 2),
          child: const Divider(),
        ),
      ],
    );
  }
}
