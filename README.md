# Nes

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]
[![shorebird ci](https://api.shorebird.dev/api/v1/github/erickzanardo/nes_ui/badge.svg)](https://console.shorebird.dev/ci)

![](banner.png)

UI library inspired by old retro video game console

## Our top sponsors

Check out these amazing sponsors that support my work!

<table style="background-color: white; border: 1px solid black">
    <tbody>
        <tr>
            <td align="center" style="border: 1px solid black">
                <a href="https://invertase.io/"><img src="https://github.com/erickzanardo/erickzanardo/raw/main/images/sponsors/invertase.jpeg" width="225"/> <br /> Invertase </a>
            </td>
        </tr>
    </tbody>
</table>

[Become a featured sponsor!](https://cherrybit.studio/featured-sponsors/)

## Installation 💻

**❗ In order to start using Nes UI you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `nes_ui` to your `pubspec.yaml`:

```yaml
dependencies:
  nes_ui:
```

Install it:

```sh
flutter packages get
```

---

## Configure it

Nes UI provides a `ThemeData` that you can add to your `MaterialApp`, that theme can be obtained
from the `flutterNesTheme` method:

```dart
import 'package:nes_ui/nes_ui.dart';

MaterialApp(
  theme: flutterNesTheme(),
);
````

Check the many arguments on the method to customize the theme.

## Font

Nes UI uses the [Press start 2P](https://fonts.google.com/specimen/Press+Start+2P)
from the [Google Fonts package](https://pub.dev/packages/google_fonts).

Google fonts will fetch the files in runtime over http. To keep that behaviour and ensure that it works,
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

## Widget gallery

Find all the widgets in this [catalog](https://nes-ui.pages.dev/) made on [Widgetbook](https://www.widgetbook.io/).

<img
  src="./widgetbook_logo.png"
  width="120"
/>

## Getting help

If you need any help or have suggestions, join our [Discord](https://discord.gg/7GHtgtDMtJ).

## Material Customized Widgets

Nes UI customizes Material widgets to fit the retro aesthetic:

 - Text (styled with Press Start 2P font)
 - TextField/TextFormField (pixelated borders)
 - Divider (pixelated thickness)

## Custom Widgets

Nes UI provides many custom widgets built from scratch:

### Buttons & Inputs
 - **NesButton** - Retro styled button with press effects
```dart
NesButton(
  onPressed: () {},
  child: Text('Click me'),
)
```
 - **NesIconButton** - Icon button with retro styling
```dart
NesIconButton(
  icon: NesIcons.instance.close,
  onPressed: () {},
)
```
 - **NesInput** - Text input field with pixelated borders
```dart
NesInput(
  controller: controller,
  label: 'Name',
)
```
 - **NesCheckbox** - Retro styled checkbox
```dart
NesCheckbox(
  value: checked,
  onChanged: (value) {},
)
```

### Display
 - **NesContainer** - Decorative container with various border styles
```dart
NesContainer(
  child: Text('Content'),
)
```
 - **NesIcon** - Pixel art icon display
```dart
NesIcon(NesIcons.instance.error)
```
 - **NesIcon16** - 16x16 pixel icon variant
 - **NesIconBadge** - Icon with badge overlay
 - **NesLoadingIndicator** - Retro loading spinner
```dart
NesLoadingIndicator()
```
 - **NesProgressBar** - Horizontal progress bar
```dart
NesProgressBar(value: 0.5)
```
 - **NesSectionHeader** - Section title header
```dart
NesSectionHeader(title: 'Section')
```
 - **NesWindow** - Window-style container
 - **NesTooltip** - Hover tooltip with retro style
 - **NesKeyIcon** - Keyboard key icon

### Lists & Selection
 - **NesSelectionList** - List with selection highlighting
```dart
NesSelectionList(
  items: ['Option 1', 'Option 2'],
  onSelected: (index) {},
)
```
 - **NesIterableOptions** - Scrollable options list
 - **NesDropdownMenu** - Dropdown selection menu
 - **NesTabView** - Tabbed content view
 - **NesTab** - Individual tab widget

### Navigation & Layout
 - **NesScaffold** - Base scaffold with retro styling
 - **NesSingleChildScrollView** - Scrollable container
 - **NesScrollbar** - Custom pixelated scrollbar
 - **NesSplitPanel** - Resizable split view
 - **NesFixedViewport** - Fixed size viewport
 - **NesDpad** - D-pad navigation control

### Feedback & Effects
 - **NesBlinker** - Text blinking effect
 - **NesPulser** - Pulsing animation
 - **NesDropshadow** - Pixel shadow effect
 - **NesSnackbar** - Retro styled snackbar
 - **NesBottomSheet** - Bottom sheet overlay
 - **NesConfirmDialog** - Confirmation dialog
```dart
NesConfirmDialog(
  title: 'Confirm',
  message: 'Are you sure?',
  onConfirm: () {},
)
```
 - **NesInputDialog** - Input dialog
 - **NesDialog** - Base dialog component

### Animation & Text
 - **NesRunningText** - Scrolling text animation
 - **NesRunningTextLines** - Multi-line scrolling text
 - **NesPressable** - Clickable wrapper with effects
 - **NesControllerFocus** - Focus highlight for controllers
 - **NesLink** - Hyperlink styled text
 - **NesCheckeredDecoration** - Checkered background
 - **NesFileExplorer** - File/folder browser UI

## Custom Extension

Nes UI is built taking advantage of the Theme Extensions and custom extensions can also be provided.
In order to provide your own extension, you need to create it, and provide it to the `flutterNesTheme`:

```dart
    theme: flutterNesTheme(
      brightness: state.lightMode ? Brightness.light : Brightness.dark,
      customExtensions: [
        CustomExampleExtension.light, // Your custom extension goes here.
      ],
    ),

```

For more information, look at the example code.

[Support this project 💙](https://cherrybit.studio/about-supporting/)

[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows<D-b>
