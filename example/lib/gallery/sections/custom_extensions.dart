import 'package:example/app/app.dart';
import 'package:flutter/material.dart';

class CustomExtensions extends StatelessWidget {
  const CustomExtensions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Custom Extensions',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          children: [
            Card(
              color: theme.extension<CustomExampleExtension>()!.card,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Card with a custom background color',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
