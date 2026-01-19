import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:universal_platform/universal_platform.dart';

/// {@template nes_window}
/// A widget that renders a window with a NES style.
///
/// A [NesWindow] is basically a styled container in a window style.
/// It doesn't do much by itself, like change its size, position, etc, that
/// should be handled by the parent widget, using the available callbacks.
///
/// {@endtemplate}
class NesWindow extends StatelessWidget {
  /// {@macro nes_window}
  const NesWindow({
    super.key,
    this.width,
    this.height,
    this.title,
    this.icon,
    this.onResize,
    this.onMove,
    this.actions = const [],
    this.onClose,
    this.child,
  });

  /// The width of the window.
  final double? width;

  /// The height of the window.
  final double? height;

  /// The title of the window.
  final String? title;

  /// The window icon.
  final NesIconData? icon;

  /// Called when the window is resized.
  final void Function(Offset)? onResize;

  /// Called when the window is moved.
  final void Function(Offset)? onMove;

  /// The window actions.
  ///
  /// These actions are display alongside the close icon (if provided) in
  /// the title bar.
  final List<(NesIconData, VoidCallback)> actions;

  /// Called when the window is closed.
  final VoidCallback? onClose;

  /// The window child.
  final Widget? child;

  MouseCursor _cursorFallback(MouseCursor cursor, MouseCursor defaultCursor) {
    if (defaultCursor == cursor && !kIsWeb && UniversalPlatform.isMacOS) {
      return SystemMouseCursors.grab;
    }
    return cursor;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();

    final nesContainerTheme = context.nesThemeExtension<NesContainerTheme>();
    final containerColor = nesContainerTheme.backgroundColor;
    final nesTheme = context.nesThemeExtension<NesTheme>();

    final titleBarHeight = (textStyle.fontSize ?? 8) + nesTheme.pixelSize * 4;
    final titleBarPadding = (nesTheme.pixelSize * 2).toDouble();

    final iconSize = Size.square(textStyle.fontSize ?? 8);

    final titleBar = SizedBox(
      width: double.infinity,
      height: titleBarHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: nesContainerTheme.borderColor,
        ),
        child: Row(
          children: [
            SizedBox(width: titleBarPadding),
            if (icon != null)
              NesIcon(
                iconData: icon!,
                size: iconSize,
                primaryColor: containerColor,
                secondaryColor: textStyle.color,
              ),
            if (title != null)
              Expanded(
                child: Center(
                  child: Text(
                    title!,
                    style: textStyle.copyWith(
                      color: containerColor,
                    ),
                  ),
                ),
              ),
            if (onClose != null)
              ...actions.map(
                (action) => NesIconButton(
                  icon: action.$1,
                  size: iconSize,
                  onPress: action.$2,
                ),
              ),
            NesIconButton(
              icon: NesIcons.close,
              size: iconSize,
              onPress: onClose,
            ),
            SizedBox(width: titleBarPadding),
          ],
        ),
      ),
    );
    final window = Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(nesTheme.pixelSize.toDouble()),
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(
          width: nesTheme.pixelSize.toDouble(),
          color: nesContainerTheme.borderColor,
        ),
      ),
      child: Column(
        children: [
          if (onMove == null)
            titleBar
          else
            MouseRegion(
              cursor: _cursorFallback(
                nesTheme.moveCursor,
                SystemMouseCursors.move,
              ),
              child: GestureDetector(
                onPanUpdate: (details) {
                  onMove?.call(details.delta);
                },
                child: titleBar,
              ),
            ),
          SizedBox(
            height: nesTheme.pixelSize.toDouble(),
          ),
          if (child != null) child!,
        ],
      ),
    );

    if (onResize != null) {
      return SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned.fill(child: window),
            // Top left corner
            Positioned(
              top: 0,
              left: 0,
              child: _ResizeHandler(
                cursor: _cursorFallback(
                  nesTheme.resizeUpLeftDownRightCursor,
                  SystemMouseCursors.resizeUpLeftDownRight,
                ),
                width: 12,
                height: 12,
                handleDelta: (offset) {
                  onMove?.call(
                    Offset(offset.dx, offset.dy),
                  );

                  onResize?.call(
                    Offset(
                      offset.dx * -1,
                      offset.dy * -1,
                    ),
                  );
                },
              ),
            ),
            // Top right corner
            Positioned(
              top: 0,
              right: 0,
              child: _ResizeHandler(
                cursor: _cursorFallback(
                  nesTheme.resizeUpRightDownLeftCursor,
                  SystemMouseCursors.resizeUpRightDownLeft,
                ),
                width: 12,
                height: 12,
                handleDelta: (offset) {
                  onMove?.call(
                    Offset(0, offset.dy),
                  );

                  onResize?.call(
                    Offset(
                      offset.dx,
                      offset.dy * -1,
                    ),
                  );
                },
              ),
            ),
            // Bottom left corner
            Positioned(
              bottom: 0,
              left: 0,
              child: _ResizeHandler(
                cursor: _cursorFallback(
                  nesTheme.resizeUpRightDownLeftCursor,
                  SystemMouseCursors.resizeUpRightDownLeft,
                ),
                width: 12,
                height: 12,
                handleDelta: (offset) {
                  onMove?.call(
                    Offset(offset.dx, 0),
                  );

                  onResize?.call(
                    Offset(
                      offset.dx * -1,
                      offset.dy,
                    ),
                  );
                },
              ),
            ),
            // Bottom right corner
            Positioned(
              bottom: 0,
              right: 0,
              child: _ResizeHandler(
                cursor: _cursorFallback(
                  nesTheme.resizeUpLeftDownRightCursor,
                  SystemMouseCursors.resizeUpLeftDownRight,
                ),
                width: 12,
                height: 12,
                handleDelta: (offset) {
                  onResize?.call(
                    Offset(
                      offset.dx,
                      offset.dy,
                    ),
                  );
                },
              ),
            ),
            // Top side
            Positioned(
              top: 0,
              left: 12,
              right: 12,
              child: _ResizeHandler(
                cursor: nesTheme.resizeUpCursor,
                width: double.infinity,
                height: 12,
                handleDelta: (offset) {
                  onMove?.call(
                    Offset(0, offset.dy),
                  );

                  onResize?.call(
                    Offset(
                      0,
                      offset.dy * -1,
                    ),
                  );
                },
              ),
            ),
            // Bottom side
            Positioned(
              bottom: 0,
              left: 12,
              right: 12,
              child: _ResizeHandler(
                cursor: nesTheme.resizeDownCursor,
                width: double.infinity,
                height: 12,
                handleDelta: (offset) {
                  onResize?.call(
                    Offset(
                      0,
                      offset.dy,
                    ),
                  );
                },
              ),
            ),
            // Left side
            Positioned(
              top: 12,
              bottom: 12,
              left: 0,
              child: _ResizeHandler(
                cursor: nesTheme.resizeLeftCursor,
                width: 12,
                height: double.infinity,
                handleDelta: (offset) {
                  onMove?.call(
                    Offset(offset.dx, 0),
                  );

                  onResize?.call(
                    Offset(
                      offset.dx * -1,
                      0,
                    ),
                  );
                },
              ),
            ),
            // Right side
            Positioned(
              top: 12,
              bottom: 12,
              right: 0,
              child: _ResizeHandler(
                cursor: nesTheme.resizeRightCursor,
                width: 12,
                height: double.infinity,
                handleDelta: (offset) {
                  onResize?.call(
                    Offset(
                      offset.dx,
                      0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return window;
  }
}

class _ResizeHandler extends StatelessWidget {
  const _ResizeHandler({
    required this.cursor,
    required this.width,
    required this.height,
    required this.handleDelta,
  });

  final MouseCursor cursor;
  final double width;
  final double height;
  final void Function(Offset)? handleDelta;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanUpdate: (details) {
        handleDelta?.call(details.delta);
      },
      child: MouseRegion(
        cursor: cursor,
        child: SizedBox(
          width: width,
          height: height,
        ),
      ),
    );
  }
}
