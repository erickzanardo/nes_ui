# Flutter Nes

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

![](banner.png)

UI library inspired by old retro video game console

## Installation 💻

**❗ In order to start using Flutter Nes you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `flutter_nes` to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_nes:
```

Install it:

```sh
flutter packages get
```

---

## Configure it

Flutter Nes provides a `ThemeData` that you can add to your `MaterialApp`, that theme can be obtained
from the `flutterNesTheme` method:

```dart
import 'package:flutter_nes/flutter_nes.dart';

MaterialApp(
  theme: flutterNesTheme(),
);
````

Check the many arguments on the method to customize the theme.

## Font

Flutter Nes uses the [Press start 2P](https://fonts.google.com/specimen/Press+Start+2P)
from the [Google Fonts package](https://pub.dev/packages/google_fonts).

Google fonts will fetch the files in runtime over http. To keep that behaviour and unsure that it works,
be sure to call `WidgetsFlutterBinding.ensureInitialized();` at your main method.

For more info on that follow this [Google Fonts package guide](https://pub.dev/packages/google_fonts#http-fetching).

If instead you want to bundle the fonts in the app and avoid http requests,
follow [this other guide](https://pub.dev/packages/google_fonts#font-bundling-in-assets).


You also should include the font license on `LicenseRegistry` when bundling it on the app.

For example:

```dart
void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  runApp(...);
}
```

More about font license [here](https://pub.dev/packages/google_fonts#licensing-fonts).

## Material Customized Widgets

Flutter Nes trives to use the most out of material that it can, customizing their looks to fit
the package desired look, here is the list of widgets from Material that are customized by
Flutter Nes

 - Text
 - TextField/TextFormField
 - Divider

## Custom Widgets

Some widgets are too different from the Material look and structure, which was not possible to
achieve without building the whole widget from scratch, this is the list of widgets that Flutter Nes
provides:

 - NesButton
 - NesCheckbox
 - NesContainer
 - NesIcon

More to come!
