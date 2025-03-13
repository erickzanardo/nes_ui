// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_app/widgetbook/use_cases/blinker.dart' as _i2;
import 'package:widgetbook_app/widgetbook/use_cases/buttons.dart' as _i3;
import 'package:widgetbook_app/widgetbook/use_cases/checkboxes.dart' as _i4;
import 'package:widgetbook_app/widgetbook/use_cases/checkered_decoration.dart'
    as _i5;
import 'package:widgetbook_app/widgetbook/use_cases/containers.dart' as _i12;
import 'package:widgetbook_app/widgetbook/use_cases/dpads.dart' as _i6;
import 'package:widgetbook_app/widgetbook/use_cases/dropdown_menus.dart' as _i7;
import 'package:widgetbook_app/widgetbook/use_cases/icons.dart' as _i8;
import 'package:widgetbook_app/widgetbook/use_cases/running_texts.dart' as _i9;
import 'package:widgetbook_app/widgetbook/use_cases/tooltips.dart' as _i10;
import 'package:widgetbook_app/widgetbook/use_cases/typography.dart' as _i11;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookLeafComponent(
        name: 'NesBlinker',
        useCase: _i1.WidgetbookUseCase(
          name: 'default',
          builder: _i2.normal,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'NesButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'error',
            builder: _i3.error,
          ),
          _i1.WidgetbookUseCase(
            name: 'normal',
            builder: _i3.normal,
          ),
          _i1.WidgetbookUseCase(
            name: 'primary',
            builder: _i3.primary,
          ),
          _i1.WidgetbookUseCase(
            name: 'success',
            builder: _i3.success,
          ),
          _i1.WidgetbookUseCase(
            name: 'warning',
            builder: _i3.warning,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'NesCheckBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'default',
          builder: _i4.checkbox,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'NesCheckeredDecoration',
        useCase: _i1.WidgetbookUseCase(
          name: 'default',
          builder: _i5.normal,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'NesDpad',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'default',
            builder: _i6.normal,
          ),
          _i1.WidgetbookUseCase(
            name: 'with callbacks',
            builder: _i6.withCallbacks,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'NesDropdownMenu',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'default',
            builder: _i7.normal,
          ),
          _i1.WidgetbookUseCase(
            name: 'with icons',
            builder: _i7.icons,
          ),
        ],
      ),
      _i1.WidgetbookComponent(
        name: 'NesIcon',
        useCases: [
          _i1.WidgetbookUseCase(
            name: '16x16',
            builder: _i8.sixteen,
          ),
          _i1.WidgetbookUseCase(
            name: '8x8',
            builder: _i8.normal,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'NesRunningText',
        useCase: _i1.WidgetbookUseCase(
          name: 'default',
          builder: _i9.normal,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'NesRunningTextLines',
        useCase: _i1.WidgetbookUseCase(
          name: 'default',
          builder: _i9.lines,
        ),
      ),
      _i1.WidgetbookLeafComponent(
        name: 'NesTooltip',
        useCase: _i1.WidgetbookUseCase(
          name: 'default',
          builder: _i10.normal,
        ),
      ),
      _i1.WidgetbookComponent(
        name: 'Text',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'body',
            builder: _i11.body,
          ),
          _i1.WidgetbookUseCase(
            name: 'display',
            builder: _i11.display,
          ),
          _i1.WidgetbookUseCase(
            name: 'headline',
            builder: _i11.headline,
          ),
          _i1.WidgetbookUseCase(
            name: 'label',
            builder: _i11.label,
          ),
          _i1.WidgetbookUseCase(
            name: 'title',
            builder: _i11.title,
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'containers',
        children: [
          _i1.WidgetbookComponent(
            name: 'NesContainer',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'default',
                builder: _i12.normal,
              ),
              _i1.WidgetbookUseCase(
                name: 'with corner inner square painter',
                builder: _i12.cornerInnerSquare,
              ),
              _i1.WidgetbookUseCase(
                name: 'with label',
                builder: _i12.label,
              ),
              _i1.WidgetbookUseCase(
                name: 'with square corner painter',
                builder: _i12.squareConer,
              ),
            ],
          )
        ],
      ),
    ],
  )
];
