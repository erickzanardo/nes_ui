// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'bottomCenter',
  type: NesSnackbar,
)
Widget bottomCenter(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
              );
            },
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'topCenter',
  type: NesSnackbar,
)
Widget topCenter(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
                alignment: Alignment.topCenter,
              );
            },
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'bottomLeft',
  type: NesSnackbar,
)
Widget bottomLeft(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
                alignment: Alignment.bottomLeft,
              );
            },
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'bottomRight',
  type: NesSnackbar,
)
Widget bottomRight(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
                alignment: Alignment.bottomRight,
              );
            },
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'topLeft',
  type: NesSnackbar,
)
Widget topLeft(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
                alignment: Alignment.topLeft,
              );
            },
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'topRight',
  type: NesSnackbar,
)
Widget topRight(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
                alignment: Alignment.topRight,
              );
            },
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'centerLeft',
  type: NesSnackbar,
)
Widget centerLeft(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
                alignment: Alignment.centerLeft,
              );
            },
          ),
        );
      },
    ),
  );
}

@widgetbook.UseCase(
  name: 'centerRight',
  type: NesSnackbar,
)
Widget centerRight(BuildContext context) {
  return NesScaffold(
    body: Builder(
      builder: (context) {
        return Center(
          child: NesButton.text(
            type: NesButtonType.primary,
            text: 'Show snackbar',
            onPressed: () {
              NesScaffoldMessenger.of(context).showSnackBar(
                const NesSnackbar(
                  text: 'This is a snackbar message!',
                ),
                alignment: Alignment.centerRight,
              );
            },
          ),
        );
      },
    ),
  );
}
