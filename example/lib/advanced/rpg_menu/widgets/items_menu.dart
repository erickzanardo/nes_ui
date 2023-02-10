import 'package:example/advanced/rpg_menu/rpg_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';

class ItemsMenu extends StatefulWidget {
  const ItemsMenu({
    super.key,
    required this.char,
    required this.onBack,
  });

  final Char char;
  final VoidCallback onBack;

  @override
  State<ItemsMenu> createState() => _ItemsMenuState();
}

class _ItemsMenuState extends State<ItemsMenu> {
  final items = <String, int>{
    'Potion': 10,
    'Ether': 20,
    'Antidote': 12,
    'Phoenix Down': 3,
    'Super Potion': 5,
    'High Potion': 1,
  };

  late final _listNode = FocusNode();
  late final _confirmationNode = FocusNode();

  int? _selected;

  @override
  void initState() {
    super.initState();

    _listNode.requestFocus();
  }

  @override
  void dispose() {
    _listNode.dispose();
    _confirmationNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      label: 'Items',
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                CharRow(char: widget.char),
                const Divider(),
                NesSelectionList(
                  focusNode: _listNode,
                  canAutoFocus: _selected == null,
                  onCancelSelection: () {
                    context.read<RpgMenuCubit>().reset();
                    widget.onBack();
                  },
                  onSelect: (i) {
                    setState(() => _selected = i);
                    _listNode.canRequestFocus = false;
                    _confirmationNode.requestFocus();
                  },
                  children: [
                    for (final entry in items.entries)
                      _Item(count: entry.value, label: entry.key),
                  ],
                ),
              ],
            ),
          ),
          if (_selected != null)
            Positioned(
              bottom: 16,
              right: 16,
              child: NesContainer(
                width: 250,
                label: 'Confirm',
                child: NesSelectionList(
                  focusNode: _confirmationNode,
                  axis: Axis.horizontal,
                  onCancelSelection: () {
                    _listNode
                      ..canRequestFocus = true
                      ..requestFocus();
                  },
                  onSelect: (v) {
                    setState(() => _selected = null);
                    _listNode
                      ..canRequestFocus = true
                      ..requestFocus();
                  },
                  children: const [
                    Text('Yes'),
                    Text('No'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.count,
    required this.label,
  });

  final int count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            '${count}x',
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(width: 16),
        Text(label),
      ],
    );
  }
}
