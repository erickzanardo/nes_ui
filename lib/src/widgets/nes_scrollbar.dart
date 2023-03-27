import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_scrollbar}
/// A scrollbar used in scrollable widgets inside Nes UI.
/// {@endtemplate}
class NesScrollbar extends StatefulWidget {
  /// {@macro nes_scrollbar}
  const NesScrollbar({
    super.key,
    required this.scrollController,
  });

  /// The scroll controller attached to this scrollbar.
  final ScrollController scrollController;

  @override
  State<NesScrollbar> createState() => _NesScrollbarState();
}

class _NesScrollbarState extends State<NesScrollbar> {

  /// TODO finish this
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    setState(() {});
  }

  double _calculateHandlerHeight(double widgetHeight) {
    return (widget.scrollController.position.maxScrollExtent / widgetHeight) *
        3;
  }

  @override
  Widget build(BuildContext context) {
    // TODO(erickzanardo): make a theme.
    return LayoutBuilder(
      builder: (context, constraints) {
        final handlerHeight = _calculateHandlerHeight(constraints.maxHeight);


        final handlerTop = 20 +
            ((widget.scrollController.offset /
                    widget.scrollController.position.maxScrollExtent) *
                (constraints.maxHeight - handlerHeight - 48));

        return Container(
          width: 28,
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
            ),
          ),
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 2,
                left: 2,
                child: NesIconButton(
                  size: const Size(16, 16),
                  icon: NesIcons.instance.topArrowIndicator,
                  onPressStart: () {
                    print('press start');
                  },
                  onPressEnd: () {
                    print('press end');
                  },
                ),
              ),
              Positioned(
                top: handlerTop,
                left: 2,
                child: ColoredBox(
                  color: Colors.black,
                  child: SizedBox(
                    width: 16,
                    height: handlerHeight,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                left: 2,
                child: NesIconButton(
                  size: const Size(16, 16),
                  icon: NesIcons.instance.bottomArrowIndicator,
                  onPressStart: () {},
                  onPressEnd: () {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
