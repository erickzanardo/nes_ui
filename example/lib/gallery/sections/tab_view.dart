import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class TabViewSection extends StatelessWidget {
  const TabViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'TabView',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const _Example(),
        const SizedBox(height: 16),
        Text(
          'Non closable TabView',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const _NonClosableExample(),
      ],
    );
  }
}

class _Example extends StatefulWidget {
  const _Example();

  @override
  State<_Example> createState() => _ExampleState();
}

class _ExampleState extends State<_Example> {
  List<String> tabs = [
    'Tab 1',
    'Tab 2',
    'Tab 3',
  ];

  int _tabIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: tabs.isEmpty
              ? const Center(child: Text('No tabs'))
              : NesTabView(
                  tabs: tabs
                      .map(
                        (e) => NesTabItem(
                          child: Center(child: Text(e)),
                          label: e,
                        ),
                      )
                      .toList(),
                  onTabClosed: (index) {
                    setState(() {
                      tabs.removeAt(index);
                    });
                  },
                ),
        ),
        const SizedBox(height: 16),
        NesButton(
          type: NesButtonType.primary,
          child: const Text('Add tab'),
          onPressed: () {
            setState(() {
              tabs.add('Tab ${_tabIndex++}');
            });
          },
        ),
      ],
    );
  }
}

class _NonClosableExample extends StatelessWidget {
  const _NonClosableExample();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 350,
      child: NesTabView(
        tabs: [
          NesTabItem(
            child: Center(child: Text('Tab 1')),
            label: 'Tab 1',
          ),
          NesTabItem(
            child: Center(child: Text('Tab 2')),
            label: 'Tab 2',
          ),
          NesTabItem(
            child: Center(child: Text('Tab 3')),
            label: 'Tab 3',
          ),
        ],
      ),
    );
  }
}
