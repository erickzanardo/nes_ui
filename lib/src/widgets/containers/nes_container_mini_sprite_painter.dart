import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_container_mini_sprite_painter}
/// A [NesContainerPainter] that renders a frame based on [MiniSprite] sprites.
///
/// This painter receives a set of [MiniSprite] sprites to draw the corners and
/// bars
/// The bars sprites will be stretched to fit the container size.
///
/// {@endtemplate}
class NesContainerMiniSpritePainter extends NesContainerPainter {
  /// {@macro nes_container_mini_sprite_painter}
  NesContainerMiniSpritePainter({
    required super.label,
    required super.pixelSize,
    required super.textStyle,
    required super.backgroundColor,
    required super.borderColor,
    required this.topLeftCorner,
    required this.topRightCorner,
    required this.bottomLeftCorner,
    required this.bottomRightCorner,
    required this.topBar,
    required this.bottomBar,
    required this.leftBar,
    required this.rightBar,
  });

  /// The [MiniSprite] used to draw the top left corner.
  final MiniSprite topLeftCorner;

  /// The [MiniSprite] used to draw the top right corner.
  final MiniSprite topRightCorner;

  /// The [MiniSprite] used to draw the bottom left corner.
  final MiniSprite bottomLeftCorner;

  /// The [MiniSprite] used to draw the bottom right corner.
  final MiniSprite bottomRightCorner;

  /// The [MiniSprite] used to draw the top bar.
  final MiniSprite topBar;

  /// The [MiniSprite] used to draw the bottom bar.
  final MiniSprite bottomBar;

  /// The [MiniSprite] used to draw the left bar.
  final MiniSprite leftBar;

  /// The [MiniSprite] used to draw the right bar.
  final MiniSprite rightBar;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = backgroundColor;

    // Render the background
    canvas.drawRect(
      Rect.fromLTWH(
        pixelSize.toDouble(),
        pixelSize.toDouble(),
        size.width - pixelSize * 2,
        size.height - pixelSize * 2,
      ),
      backgroundPaint,
    );

    // Render the corners
    _renderMiniSprite(
      sprite: topLeftCorner,
      canvas: canvas,
      pixelSize: pixelSize.toDouble(),
      colors: [borderColor],
    );

    final topRightCornerWidth = topRightCorner.pixels[0].length * pixelSize;
    canvas
      ..save()
      ..translate(size.width - topRightCornerWidth, 0);
    _renderMiniSprite(
      sprite: topRightCorner,
      canvas: canvas,
      pixelSize: pixelSize.toDouble(),
      colors: [borderColor],
    );
    canvas.restore();

    final bottomSpriteHeight = bottomLeftCorner.pixels.length * pixelSize;
    canvas
      ..save()
      ..translate(0, size.height - bottomSpriteHeight);
    _renderMiniSprite(
      sprite: bottomLeftCorner,
      canvas: canvas,
      pixelSize: pixelSize.toDouble(),
      colors: [borderColor],
    );
    canvas.restore();

    final spriteWidthBottom = bottomRightCorner.pixels[0].length * pixelSize;
    canvas
      ..save()
      ..translate(
        size.width - spriteWidthBottom,
        size.height - bottomSpriteHeight,
      );
    _renderMiniSprite(
      sprite: bottomRightCorner,
      canvas: canvas,
      pixelSize: pixelSize.toDouble(),
      colors: [borderColor],
    );
    canvas.restore();

    // Render the top bar
    final topBarWidth = topBar.pixels[0].length * pixelSize;
    for (var x = topBarWidth; x < size.width - topBarWidth; x += topBarWidth) {
      canvas
        ..save()
        ..translate(x.toDouble(), 0);

      _renderMiniSprite(
        sprite: topBar,
        canvas: canvas,
        pixelSize: pixelSize.toDouble(),
        colors: [borderColor],
      );

      canvas.restore();
    }

    // Render the bottom bar
    final bottomBarWidth = bottomBar.pixels[0].length * pixelSize;
    final bottomBarHeight = bottomBar.pixels.length * pixelSize;
    for (
      var x = bottomBarWidth;
      x < size.width - bottomBarWidth;
      x += bottomBarWidth
    ) {
      canvas
        ..save()
        ..translate(x.toDouble(), size.height - bottomBarHeight);

      _renderMiniSprite(
        sprite: bottomBar,
        canvas: canvas,
        pixelSize: pixelSize.toDouble(),
        colors: [borderColor],
      );

      canvas.restore();
    }

    // Render the left bar
    final leftBarHeight = leftBar.pixels.length * pixelSize;
    for (
      var y = leftBarHeight;
      y < size.height - leftBarHeight;
      y += leftBarHeight
    ) {
      canvas
        ..save()
        ..translate(0, y.toDouble());

      _renderMiniSprite(
        sprite: leftBar,
        canvas: canvas,
        pixelSize: pixelSize.toDouble(),
        colors: [borderColor],
      );

      canvas.restore();
    }

    // Render the right bar
    final rightBarWidth = rightBar.pixels[0].length * pixelSize;
    final rightBarHeight = rightBar.pixels.length * pixelSize;
    for (
      var y = rightBarHeight;
      y < size.height - rightBarHeight;
      y += rightBarHeight
    ) {
      canvas
        ..save()
        ..translate(size.width - rightBarWidth, y.toDouble());

      _renderMiniSprite(
        sprite: rightBar,
        canvas: canvas,
        pixelSize: pixelSize.toDouble(),
        colors: [borderColor],
      );

      canvas.restore();
    }

    drawDefaultLabel(canvas, backgroundPaint);
  }

  void _renderMiniSprite({
    required MiniSprite sprite,
    required Canvas canvas,
    required double pixelSize,
    required List<Color> colors,
  }) {
    final paints = colors.map((color) {
      return Paint()..color = color;
    }).toList();

    for (var y = 0; y < sprite.pixels.length; y++) {
      for (var x = 0; x < sprite.pixels[y].length; x++) {
        final pixel = sprite.pixels[y][x];
        if (pixel >= 0 && pixel < paints.length) {
          canvas.drawRect(
            Rect.fromLTWH(x * pixelSize, y * pixelSize, pixelSize, pixelSize),
            paints[pixel],
          );
        }
      }
    }
  }
}
