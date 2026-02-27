// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Widget build({
  required List<TextStyle?> textStyles,
  required List<String> texts,
}) => Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      for (var i = 0; i < textStyles.length; i++)
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(texts[i], style: textStyles[i]),
        ),
    ],
  ),
);

@widgetbook.UseCase(name: 'body', type: Text)
Widget body(BuildContext context) => build(
  textStyles: [
    Theme.of(context).textTheme.bodySmall,
    Theme.of(context).textTheme.bodyMedium,
    Theme.of(context).textTheme.bodyLarge,
  ],
  texts: ['Body Small', 'Body Medium', 'Body Large'],
);

@widgetbook.UseCase(name: 'display', type: Text)
Widget display(BuildContext context) => build(
  textStyles: [
    Theme.of(context).textTheme.displaySmall,
    Theme.of(context).textTheme.displayMedium,
    Theme.of(context).textTheme.displayLarge,
  ],
  texts: ['Display Small', 'Display Medium', 'Display Large'],
);

@widgetbook.UseCase(name: 'headline', type: Text)
Widget headline(BuildContext context) => build(
  textStyles: [
    Theme.of(context).textTheme.headlineSmall,
    Theme.of(context).textTheme.headlineMedium,
    Theme.of(context).textTheme.headlineLarge,
  ],
  texts: ['Headline Small', 'Headline Medium', 'Headline Large'],
);

@widgetbook.UseCase(name: 'title', type: Text)
Widget title(BuildContext context) => build(
  textStyles: [
    Theme.of(context).textTheme.titleSmall,
    Theme.of(context).textTheme.titleMedium,
    Theme.of(context).textTheme.titleLarge,
  ],
  texts: ['Title Small', 'Title Medium', 'Title Large'],
);

@widgetbook.UseCase(name: 'label', type: Text)
Widget label(BuildContext context) => build(
  textStyles: [
    Theme.of(context).textTheme.labelSmall,
    Theme.of(context).textTheme.labelMedium,
    Theme.of(context).textTheme.labelLarge,
  ],
  texts: ['Label Small', 'Label Medium', 'Label Large'],
);
