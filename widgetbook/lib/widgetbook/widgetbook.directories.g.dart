// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_app/widgetbook/use_cases/blinker.dart'
    as _widgetbook_app_widgetbook_use_cases_blinker;
import 'package:widgetbook_app/widgetbook/use_cases/bottom_sheets.dart'
    as _widgetbook_app_widgetbook_use_cases_bottom_sheets;
import 'package:widgetbook_app/widgetbook/use_cases/buttons.dart'
    as _widgetbook_app_widgetbook_use_cases_buttons;
import 'package:widgetbook_app/widgetbook/use_cases/checkboxes.dart'
    as _widgetbook_app_widgetbook_use_cases_checkboxes;
import 'package:widgetbook_app/widgetbook/use_cases/checkered_decoration.dart'
    as _widgetbook_app_widgetbook_use_cases_checkered_decoration;
import 'package:widgetbook_app/widgetbook/use_cases/confirm_dialog.dart'
    as _widgetbook_app_widgetbook_use_cases_confirm_dialog;
import 'package:widgetbook_app/widgetbook/use_cases/containers.dart'
    as _widgetbook_app_widgetbook_use_cases_containers;
import 'package:widgetbook_app/widgetbook/use_cases/dialog.dart'
    as _widgetbook_app_widgetbook_use_cases_dialog;
import 'package:widgetbook_app/widgetbook/use_cases/dpads.dart'
    as _widgetbook_app_widgetbook_use_cases_dpads;
import 'package:widgetbook_app/widgetbook/use_cases/dropdown_menus.dart'
    as _widgetbook_app_widgetbook_use_cases_dropdown_menus;
import 'package:widgetbook_app/widgetbook/use_cases/dropshadow.dart'
    as _widgetbook_app_widgetbook_use_cases_dropshadow;
import 'package:widgetbook_app/widgetbook/use_cases/icon_badge.dart'
    as _widgetbook_app_widgetbook_use_cases_icon_badge;
import 'package:widgetbook_app/widgetbook/use_cases/icons.dart'
    as _widgetbook_app_widgetbook_use_cases_icons;
import 'package:widgetbook_app/widgetbook/use_cases/input_dialog.dart'
    as _widgetbook_app_widgetbook_use_cases_input_dialog;
import 'package:widgetbook_app/widgetbook/use_cases/links.dart'
    as _widgetbook_app_widgetbook_use_cases_links;
import 'package:widgetbook_app/widgetbook/use_cases/loading_indicator.dart'
    as _widgetbook_app_widgetbook_use_cases_loading_indicator;
import 'package:widgetbook_app/widgetbook/use_cases/pressable.dart'
    as _widgetbook_app_widgetbook_use_cases_pressable;
import 'package:widgetbook_app/widgetbook/use_cases/progress_bar.dart'
    as _widgetbook_app_widgetbook_use_cases_progress_bar;
import 'package:widgetbook_app/widgetbook/use_cases/running_texts.dart'
    as _widgetbook_app_widgetbook_use_cases_running_texts;
import 'package:widgetbook_app/widgetbook/use_cases/screen_transitions.dart'
    as _widgetbook_app_widgetbook_use_cases_screen_transitions;
import 'package:widgetbook_app/widgetbook/use_cases/single_child_scroll_view.dart'
    as _widgetbook_app_widgetbook_use_cases_single_child_scroll_view;
import 'package:widgetbook_app/widgetbook/use_cases/snackbar.dart'
    as _widgetbook_app_widgetbook_use_cases_snackbar;
import 'package:widgetbook_app/widgetbook/use_cases/split_panel.dart'
    as _widgetbook_app_widgetbook_use_cases_split_panel;
import 'package:widgetbook_app/widgetbook/use_cases/tabs.dart'
    as _widgetbook_app_widgetbook_use_cases_tabs;
import 'package:widgetbook_app/widgetbook/use_cases/tooltips.dart'
    as _widgetbook_app_widgetbook_use_cases_tooltips;
import 'package:widgetbook_app/widgetbook/use_cases/typography.dart'
    as _widgetbook_app_widgetbook_use_cases_typography;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'screen_transitions',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'NesFillTransition',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder:
                _widgetbook_app_widgetbook_use_cases_screen_transitions.fill,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesHorizontalCloseTransition',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_screen_transitions
                .horizontalClose,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesHorizontalGridTransition',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_screen_transitions
                .horizontalGrid,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesVerticalCloseTransition',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_screen_transitions
                .verticalClose,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesVerticalGridTransition',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_screen_transitions
                .verticalGrid,
          )
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'NesBlinker',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_blinker.normal,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesBottomSheet',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_bottom_sheets.normal,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesButton',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'error',
            builder: _widgetbook_app_widgetbook_use_cases_buttons.error,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'normal',
            builder: _widgetbook_app_widgetbook_use_cases_buttons.normal,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'primary',
            builder: _widgetbook_app_widgetbook_use_cases_buttons.primary,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'success',
            builder: _widgetbook_app_widgetbook_use_cases_buttons.success,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'warning',
            builder: _widgetbook_app_widgetbook_use_cases_buttons.warning,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesCheckBox',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_checkboxes.checkbox,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesCheckeredDecoration',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_checkered_decoration
                .normal,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesDpad',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_dpads.normal,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'with callbacks',
            builder: _widgetbook_app_widgetbook_use_cases_dpads.withCallbacks,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesDropdownMenu',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_dropdown_menus.normal,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'with icons',
            builder: _widgetbook_app_widgetbook_use_cases_dropdown_menus.icons,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesDropshadow',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'custom offset',
            builder:
                _widgetbook_app_widgetbook_use_cases_dropshadow.customOffset,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_dropshadow.normal,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesIcon',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: '16x16',
            builder: _widgetbook_app_widgetbook_use_cases_icons.sixteen,
          ),
          _widgetbook.WidgetbookUseCase(
            name: '8x8',
            builder: _widgetbook_app_widgetbook_use_cases_icons.normal,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesIconBadge',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'custom size',
            builder: _widgetbook_app_widgetbook_use_cases_icon_badge.customSize,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_icon_badge.normal,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesLink',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'disabled',
            builder: _widgetbook_app_widgetbook_use_cases_links.primary,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'normal',
            builder: _widgetbook_app_widgetbook_use_cases_links.normal,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesPressable',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_pressable.normal,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesRunningText',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_running_texts.normal,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesRunningTextLines',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_running_texts.lines,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesSingleChildScrollView',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder:
                _widgetbook_app_widgetbook_use_cases_single_child_scroll_view
                    .normal,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'horizontal',
            builder:
                _widgetbook_app_widgetbook_use_cases_single_child_scroll_view
                    .horizontal,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'with clip content',
            builder:
                _widgetbook_app_widgetbook_use_cases_single_child_scroll_view
                    .clipContent,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesSnackbar',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'bottomCenter',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.bottomCenter,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'bottomLeft',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.bottomLeft,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'bottomRight',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.bottomRight,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'centerLeft',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.centerLeft,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'centerRight',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.centerRight,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'topCenter',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.topCenter,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'topLeft',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.topLeft,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'topRight',
            builder: _widgetbook_app_widgetbook_use_cases_snackbar.topRight,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesSplitPanel',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder:
                _widgetbook_app_widgetbook_use_cases_split_panel.defaultCase,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'nested panels',
            builder:
                _widgetbook_app_widgetbook_use_cases_split_panel.nestedPanels,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'vertical',
            builder: _widgetbook_app_widgetbook_use_cases_split_panel.vertical,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'with custom resizer size',
            builder: _widgetbook_app_widgetbook_use_cases_split_panel
                .customResizerSize,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'with initial sizes',
            builder: _widgetbook_app_widgetbook_use_cases_split_panel
                .withInitialSizes,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesTabView',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_tabs.normal,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'with icon',
            builder: _widgetbook_app_widgetbook_use_cases_tabs.withIcon,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'with icon only',
            builder: _widgetbook_app_widgetbook_use_cases_tabs.withIconOnly,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'NesTooltip',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'default',
            builder: _widgetbook_app_widgetbook_use_cases_tooltips.normal,
          )
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'Text',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'body',
            builder: _widgetbook_app_widgetbook_use_cases_typography.body,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'display',
            builder: _widgetbook_app_widgetbook_use_cases_typography.display,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'headline',
            builder: _widgetbook_app_widgetbook_use_cases_typography.headline,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'label',
            builder: _widgetbook_app_widgetbook_use_cases_typography.label,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'title',
            builder: _widgetbook_app_widgetbook_use_cases_typography.title,
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'containers',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'NesContainer',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'default',
                builder: _widgetbook_app_widgetbook_use_cases_containers.normal,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'with corner inner square painter',
                builder: _widgetbook_app_widgetbook_use_cases_containers
                    .cornerInnerSquare,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'with label',
                builder: _widgetbook_app_widgetbook_use_cases_containers.label,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'with mini sprite painter',
                builder: _widgetbook_app_widgetbook_use_cases_containers
                    .miniSpritePainer,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'with square corner painter',
                builder:
                    _widgetbook_app_widgetbook_use_cases_containers.squareConer,
              ),
            ],
          )
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'dialogs',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'NesConfirmDialog',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'default',
                builder:
                    _widgetbook_app_widgetbook_use_cases_confirm_dialog.normal,
              )
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'NesDialog',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'default',
                builder: _widgetbook_app_widgetbook_use_cases_dialog.normal,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'using confirm shortcut',
                builder:
                    _widgetbook_app_widgetbook_use_cases_dialog.confirmShortcut,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'window style',
                builder:
                    _widgetbook_app_widgetbook_use_cases_dialog.windowStyle,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'without close button',
                builder:
                    _widgetbook_app_widgetbook_use_cases_dialog.noCloseButton,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'NesInputDialog',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'default',
                builder:
                    _widgetbook_app_widgetbook_use_cases_input_dialog.normal,
              )
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'loading indicators',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'NesHourglassLoadingIndicator',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'NesHourglassLoadingIndicator',
                builder: _widgetbook_app_widgetbook_use_cases_loading_indicator
                    .hourglass,
              )
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'NesJumpingIconsLoadingIndicator',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'NesJumpingIconsLoadingIndicator',
                builder: _widgetbook_app_widgetbook_use_cases_loading_indicator
                    .jumpingIcons,
              )
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'NesMutatingIconsLoadingIndicator',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'NesMutatingIconsLoadingIndicator',
                builder: _widgetbook_app_widgetbook_use_cases_loading_indicator
                    .mutatingIcons,
              )
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'NesPixelRowLoadingIndicator',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'NesPixelRowLoadingIndicator',
                builder: _widgetbook_app_widgetbook_use_cases_loading_indicator
                    .pixelRow,
              )
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'NesTerminalLoadingIndicator',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'NesTerminalLoadingIndicator',
                builder: _widgetbook_app_widgetbook_use_cases_loading_indicator
                    .terminal,
              )
            ],
          ),
        ],
      ),
      _widgetbook.WidgetbookFolder(
        name: 'progressbar',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'NesProgressBar',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'pixel',
                builder:
                    _widgetbook_app_widgetbook_use_cases_progress_bar.pixel,
              ),
              _widgetbook.WidgetbookUseCase(
                name: 'smooth',
                builder:
                    _widgetbook_app_widgetbook_use_cases_progress_bar.smooth,
              ),
            ],
          )
        ],
      ),
    ],
  ),
];
