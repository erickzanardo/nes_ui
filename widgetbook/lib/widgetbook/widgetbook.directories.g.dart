// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_app/widgetbook/use_cases/buttons.dart' as _i2;
import 'package:widgetbook_app/widgetbook/use_cases/checkboxes.dart' as _i3;
import 'package:widgetbook_app/widgetbook/use_cases/containers.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'NesButton',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'error',
            builder: _i2.error,
          ),
          _i1.WidgetbookUseCase(
            name: 'normal',
            builder: _i2.normal,
          ),
          _i1.WidgetbookUseCase(
            name: 'primary',
            builder: _i2.primary,
          ),
          _i1.WidgetbookUseCase(
            name: 'success',
            builder: _i2.success,
          ),
          _i1.WidgetbookUseCase(
            name: 'warning',
            builder: _i2.warning,
          ),
        ],
      ),
      _i1.WidgetbookLeafComponent(
        name: 'NesCheckBox',
        useCase: _i1.WidgetbookUseCase(
          name: 'default',
          builder: _i3.checkbox,
        ),
      ),
      _i1.WidgetbookFolder(
        name: 'containers',
        children: [
          _i1.WidgetbookComponent(
            name: 'NesContainer',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'default',
                builder: _i4.normal,
              ),
              _i1.WidgetbookUseCase(
                name: 'with corner inner square painter',
                builder: _i4.cornerInnerSquare,
              ),
              _i1.WidgetbookUseCase(
                name: 'with label',
                builder: _i4.label,
              ),
              _i1.WidgetbookUseCase(
                name: 'with square corner painter',
                builder: _i4.squareConer,
              ),
            ],
          )
        ],
      ),
    ],
  )
];
