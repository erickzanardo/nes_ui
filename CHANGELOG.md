# 0.27.0
 - feat: adding `buttonWidth` attribute to `NesButton.text` constructor.
 - feat: adding `iconSize` attribute to `NesButton.icon` constructor.
 - feat: adding `NesIcons.cat`.
 - feat: adding `NesIcons.hat`.

# 0.26.0
 - feat: adding `NesIcons.lock`.
 - feat: adding `NesIcons.key`.
 - feat: adding `NesIcons.crane`.

# 0.25.0
 - feat: Adding a painter to `NesContainer` to allow usage of mini sprites for its border rendering.
 - feat: Adding a customizable `CustomPainter` to `NesButton`.
 - fix: Remove additional usage of `dart:io` in favor of `package:universal_platform` for better web support.
 - feat: Adding `NesRunningText` for a global customization of the running text widgets.
 - feat: Allow snackbar to have their text style customized
 - feat: Option to hide the close button on `NesDialog`s.

# 0.24.1
 - fix: `NesBottomSheet` would rely on the "root" theme, which would break if it was not a nes ui one.
 - fix: Remove usage of `dart:io` in favor of `package:universal_platform` for better web support.

# 0.24.0
 - feat: Adding `NesIcons.heart`
 - feat: Adding `NesLink`

# 0.23.0
 - fix: `NesDialog` would rely on the "root" theme, which would break if it was not a nes ui one.
 - feat: Dialogs now can be "confirmed" with the enter key, and the cancel (esc key) can be intercepted by the developer now
 - feat: adding `NesProgressBar` and `NesProgressBarTheme`. (Thanks @moldypenguins)

# 0.22.1
 - fix: Update NesTooltip to use OverlayPortal (Thanks @moldypenguins)

# 0.22.0
 - feat: adding `NesIcons.shovel`.
 - feat: adding `NesDpad`
 - feat: adding `NesIcons.gem`.
 - feat: adding `initialTabIndex` to `NesTabView`

# 0.21.0
 - Update to Flutter 3.22.0
 - feat: adding `NesDropdownMenu`
 - feat: adding `NesContainer.borderColor` to allow customizing the border color.
 - feat: Simply `NesSelectionList` to not show two cursors
 - feat: adding option to better customize `TextInput`s
 - feat: adding `NesSelectionList.disabledItems`
 - feat: `NesPressable` is only pressable when has listeners.
 - feat: adding `NesIcons.block`
 - feat: adding `NesIconButton.badge`
 - feat: adding NesTheme.screenTransitionCursor
 - chore: removing deprecated members from Color.

# 0.20.0
 - feat: adding different frames to `NesDialog`s
 - feat: allow `NesFileExplorer` to have custom icons
 - feat: adding `NesIcons.alien`
 - feat: allow `NesScaffold` and allow snackbars to be shown on them.
 - feat: route transitions can have their duration customized. Thanks @adil192

# 0.19.0
 - feat: adding `NesSectionHeader`
 - feat: adding `NesIcons16.check`
 - feat: Dialogs close on ESC key.
 - feat: adding `NesIcons.bell` and `NesIcons16.bell`
 - feat: adding `NesIcons16.close`
 - feat: adding `NesIcons16.handPointingRight`
 - feat: adding `NesIcons16.leftArrowIndicator`
 - feat: adding `NesIcons16.rightArrowIndicator`
 - feat: adding `NesIcons16.topArrowIndicator`
 - feat: adding `NesIcons16.bottomArrowIndicator`

# 0.18.0
 - feat: add `NesIcons.wrench`
 - feat: add `NesIcons.discord`
 - feat: Getting nes ui ready for 16x16 icons.

# 0.17.0
 - feat: add `NesIcons.market`
 - feat: add `NesIcons.play`
 - feat: add `NesIcons.plause`
 - feat: add `NesIcons.upload`
 - feat: add `NesBottomSheet`
 - fix: Dialogs corner to not show material background color.

# 0.16.0
 - feat: add `NesIcons.camera`
 - chore: Removing usage from deprecated members from Flutter 3.18.
 - fix!: `NesDialog`s are now aware of the a `NesFixedViewport` scaling value.

# 0.15.0
 - feat: add `NesIcons.audioMuted`
 - feat: screen transitions can have their cursor customized.
 - feat: add `NesCheckeredDecoration`.
 - feat: Improve Dialogs background and cursor support.
 - feat: `NesButton` now have a click cursor.

# 0.14.0
 - feat: add `NesIcons.audio`.
 - feat: add `NesIcons.screen`.
 - feat: add `NesIcons.rename`.
 - feat: add `NesIcons.hamburgerMenu`.
 - feat: adding `NesButton` helper constructors.
 - feat: add `NesIcons.arrowCursor`.
 - feat: `NesWindow` uses `NesContainerTheme` instead of Material's card.
 - feat: update mini sprite to improve icons.
 - feat: add `NesIcons.center`.
 - feat: add ability to customize mouse cursors used by the package.

# 0.13.0
 - feat: `NesContainer.paintBuilder` to override the one set on the theme.
 - fix: `NesRunningText` was not disposing its controller.
 - feat: add `NesRunningTextLines`.
 - feat: add `NesPulser`.
 - feat: allow duration to be configured on selection list.
 - feat: add `NesIcons.penguin`.
 - feat: add `NesIcons.apple`.
 - feat: add `NesIcons.windows`.

# 0.12.1
 - fix: theme lerp causing error on null access.

# 0.12.0
 - feat: adding `NesBlinker`.
 - fix: `NesRunningText` would not update its text.
 - feat: add `HitTestBehavior` property to `NesPressable`.
 - feat: add `NesIcons.factory`.
 - feat: add `NesIcons.rail`.
 - feat: add `NesIcons.robot`.
 - feat: add `NesIcons.pickaxe`.
 - feat: add `NesIcons.oven`.
 - feat: add `NesIcons.rotate`.
 - feat: allow `NesContainer` to have their border customizable
 - feat: add `NesContainerCornerInnerSquarePainter`
 - feat: add `NesContainerSquareCornerPainter`

# 0.11.0
 - feat: add ability to customize `NesContainer`s pixel sizes.
 - feat: add ability to customize `NesButton`s pixel sizes.
 - feat: add `NesIcons.clock`
 - feat: add `NesIcons.tree`
 - feat: add `NesIcons.energy`
 - feat: add `NesIcons.leaves`
 - feat: add `NesIcons.fruit`
 - feat: add `NesIcons.fatArrowUp`
 - feat: add `NesIcons.fatArrowDown`
 - feat: add `NesIcons.hammer`
 - feat: add `NesIcons.owl`
 - feat: add `NesIconBadge`
 - feat: add `NesIcons.letter`
 - feat: adding arrow direction to `NesTooltip`
 - fix: Icon button disabled property
 - feat: Adding `NesRunningText`

# 0.10.0
 - feat: add `NesIcons.user`
 - feat: add `NesIcons.chest`
 - feat: add `NesIcons.lamp`
 - feat: `NesIconButton` can customizes the icon color.
 - feat: add `NesFixedViewport`.

# 0.9.0
 - feat: add `NesIcons.expand`
 - fix: `NesDialog` allows a generic to be informed.
 - feat: add `NesIcons.cut`
 - feat: add `NesIcons.eraser`
 - feat: add `NesIcons.copy`
 - feat: add `NesIcons.paste`
 - feat: add `NesIcons.tv`
 - feat: add `NesIcons.radio`
 - feat!: add button icon themes
 - refactor: Use NesIcons.someIcon instead of NesIcons.instance.someIcon
 - feat: add `NesInputDialog`
 - feat: add `NesIcons.hourglassMiddle`
 - feat: add `NesIcons.hourglassTopFull`
 - feat: add `NesIcons.hourglassBottomFull`
 - feat: add `NesHourglassLoadingIndicator`
 - feat: add `NesTerminalLoadingIndicator`
 - feat: add `NesJumpingIconsLoadingIndicator`
 - feat: add `NesMutatingIconsLoadingIndicator`
 - feat: add `NesPixelRowLoadingIndicator`
 - feat: add `NesIcons.flag`
 - feat: add `NesIcons.checkedFlag`

# 0.8.0
 - feat: add `NesIcons.leftHand`
 - feat: add `NesIcons.rightHand`
 - feat: add `NesIcons.helm`
 - feat: add `NesIcons.upperArmor`
 - feat: add `NesIcons.lowerArmor`
 - feat: add `NesIcons.exchange`
 - feat: add `NesVerticalGridTransition`
 - feat: add `NesHorizontalGridTransition`
 - feat: change `NesTabView` to hide close icons when no handler is informed
 - feat: add `NesContainerTheme` to theming for improved customization of `NesContainer`s
 - feat: add `NesButtonTheme`.borderColor for improved customization of `NesButton`s
 - feat: change `NesTab`to use the same border color as `NesContainer`s for design consistency.
 - feat: allow `NesContainer` to have a customizable `padding`.
 - feat: add `NesDialog`.
 - feat: `NesButton` font colors applies to material icons.
 - feat: add `NesIcons.edit`

# 0.7.0

 - feat: add `NesIcons.download`
 - fix: add icon fallbacks for MacOS on `NesWindow`.
 - feat: add `NesIcons.zoomIn`
 - feat: add `NesIcons.zoomOut`
 - feat: add `NesIcons.yamlFile`
 - feat: add `NesIcons.xmlFile`
 - fix: `NesTabView` didn't keept state on tab change.
 - feat: add `NesIcons.exclamationMarkBlock`
 - feat: add `NesIcons.questionMarkBlock`
 - feat: add `NesTooltip`

# 0.6.0

 - feat: add `NesIcons.threeVerticalDots`
 - feat: add `NesIcons.threeHorizontalDots`
 - feat: add `NesIcons.newFile`
 - feat: add `NesIcons.saveFile`
 - feat: add `NesIcons.openEye`
 - feat: add `NesIcons.closedEye`
 - fix: `NesScrollbar` has the wrong border colors
 - feat: add `NesSingleChildScrollview.clipContent`
 - feat: add `NesTabView`
 - feat: Update `NesButton` widget to enable/disable based on onPressed value
 - feat: add `NesSplitPanel`
 - feat: add `NesSnackbar`
 - fix: `NesFileExplorer` entries update.
 - feat: Add disabled state to `NesIconButton`.
 - feat: Add option to individual custom color for `NesIcon`s.
 - feat: Add `NesWindow`.
 - feat: Add `NesDropshadow`.
 - feat: Upgrade to Flutter 3.10.0.
 - feat: add `NesIcons.window`
 - feat: add `NesIcons.textFile`

# 0.5.0

 - feat: add `NesIcons.musicNote`
 - feat: add `NesIcons.keyHole`
 - feat: add `NesIcons.questionMark`
 - feat: add `NesIcons.dartLang`
 - feat: add `NesIcons.middleConnection`
 - feat: add `NesIcons.topConnection`
 - feat: add `NesIcons.bottomConnection`
 - feat: add `NesFileExplorer`
 - feat: add `NesIcons.topArrowIndicator`
 - feat: add `NesIcons.bottomArrowIndicator`
 - feat: add `NesScrollbar`
 - feat: add `NesSingleChildScrollview`

# 0.4.0

 - feat: add `NesConfirmDialog`
 - feat: add `NesFillTransition`
 - feat: add `NesHorizontalCloseTransition`
 - feat: add `NesVerticalCloseTransition`

# 0.3.0

- feat: add `backgroundColor` to `NesContainer`
- fix: `NesController` throwing initialization errors
- feat: add `NesIcons.openFolder`
- feat: add `NesIcons.closedFolder`
- feat: add `NesPressable`
- feat: add `NesIconButton`
- feat: add `NesIcons.thinArrowLeft`
- feat: add `NesIcons.thinArrowRight`
- feat: add `NesIterableOptions`

# 0.2.0

- feat: add `NesSelectionList`
- feat: `NesIcon` supports custom size
- feat: add `NesIcons.gallery`
- feat: add `NesIcons.delete`
- feat: add `NesIcons.add`
- feat: add `NesIcons.remove`
- feat: add `NesIcons.redo`
- feat: add `customExtensions`
- feat: add keyboard support
- feat: add `NesIcons.unpressedButton`
- feat: add `NesIcons.pressedButton`
- feat: add `NesKeyButton`

# 0.1.0

- feat: initial release 🎉
