// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class UseCaseDecorator extends StatelessWidget {
  const UseCaseDecorator({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[600],
      ),
      child: SizedBox.expand(
        child: Material(child: child),
      ),
    );
  }
}
