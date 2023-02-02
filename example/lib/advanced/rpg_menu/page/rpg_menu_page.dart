import 'package:example/advanced/rpg_menu/rpg_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';

class RpgMenuPage extends StatefulWidget {
  const RpgMenuPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => RpgMenuCubit(),
          child: const RpgMenuPage(),
        );
      },
    );
  }

  @override
  State<RpgMenuPage> createState() => _RpgMenuPageState();
}

class _RpgMenuPageState extends State<RpgMenuPage> {
  late final _categoryNode = FocusNode();
  late final _characterNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _categoryNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<RpgMenuCubit>();
    final state = cubit.state;

    return BlocListener<RpgMenuCubit, RpgMenuState>(
      listener: (BuildContext context, RpgMenuState state) {
        if (state.category != null && state.char == null) {
          _characterNode.requestFocus();
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 250,
                child: Column(
                  children: [
                    Expanded(
                      child: NesContainer(
                        child: NesSelectionList(
                          focusNode: _categoryNode,
                          onSelect: (value) {
                            cubit.selectCategory(Category.values[value]);
                          },
                          children: Category.values.map((v) {
                            return Expanded(child: Text(v.name));
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const NesContainer(
                      width: double.infinity,
                      label: 'Time Played',
                      child: Text('00:02'),
                    ),
                    const SizedBox(height: 16),
                    const NesContainer(
                      width: double.infinity,
                      label: 'Money',
                      child: Text(r'$200'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: NesContainer(
                  child: NesSelectionList(
                    canAutoFocus: state.category != null,
                    focusNode: _characterNode,
                    onSelect: (i) {},
                    children: [
                      for (var char in Char.values)
                        Expanded(
                          child: CharRow(
                            char: char,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CharAttributes {
  const CharAttributes({
    required this.name,
    required this.avatar,
    required this.charClass,
    required this.maxHp,
    required this.maxMp,
  });

  final String name;
  final String avatar;
  final String charClass;
  final int maxHp;
  final int maxMp;
}

extension CharX on Char {
  CharAttributes get attributes {
    switch (this) {
      case Char.dash:
        return const CharAttributes(
          name: 'Dash',
          avatar: 'assets/avatars/dash.png',
          charClass: 'Scout',
          maxHp: 10,
          maxMp: 8,
        );
      case Char.ember:
        return const CharAttributes(
          name: 'Ember',
          avatar: 'assets/avatars/ember.png',
          charClass: 'Fire Elemental',
          maxHp: 8,
          maxMp: 12,
        );
      case Char.hank:
        return const CharAttributes(
          name: 'Hank',
          avatar: 'assets/avatars/hank.png',
          charClass: 'Open Sourcerer',
          maxHp: 7,
          maxMp: 14,
        );
    }
  }
}

class CharRow extends StatelessWidget {
  const CharRow({super.key, required this.char});

  final Char char;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              char.attributes.avatar,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 64),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        char.attributes.charClass,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(char.attributes.name),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HP',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${char.attributes.maxHp} / ${char.attributes.maxHp}',
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MP',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${char.attributes.maxMp} / ${char.attributes.maxMp}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
