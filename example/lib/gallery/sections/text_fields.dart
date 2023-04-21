import 'package:flutter/material.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Text Fields',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const Column(
          children: [
            TextField(),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                label: Text('Label'),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                label: Text('Label'),
                errorText: 'Ops, pixels are cool',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
