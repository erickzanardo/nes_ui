// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Widget build({String? initialValue, bool readOnly = false, String? errorText}) {
  return Center(
    child: SizedBox(
      width: 300,
      child: TextField(
        readOnly: readOnly,
        controller: initialValue != null
            ? TextEditingController(text: initialValue)
            : null,
        decoration: InputDecoration(
          errorText: errorText,
          hintText: readOnly ? null : 'Enter text...',
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'default', type: TextField)
Widget defaultInput(BuildContext context) => build();

@widgetbook.UseCase(name: 'with value', type: TextField)
Widget withValue(BuildContext context) => build(initialValue: 'Hello World');

@widgetbook.UseCase(name: 'read only', type: TextField)
Widget readOnly(BuildContext context) =>
    build(initialValue: 'Read only text', readOnly: true);

@widgetbook.UseCase(name: 'error', type: TextField)
Widget error(BuildContext context) => build(errorText: 'Error message');
