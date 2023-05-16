import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class WindowManagerPage extends StatefulWidget {
  const WindowManagerPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const WindowManagerPage(),
    );
  }

  @override
  State createState() => _WindowManagerPageState();
}

class _Window {
  _Window(this.x, this.y, this.w, this.h);

  double x;
  double y;
  double w;
  double h;
}

class _WindowManagerPageState extends State<WindowManagerPage> {
  final Map<String, _Window> _windows = {
    'nes.txt': _Window(50, 50, 200, 200),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 32,
            left: 32,
            child: SizedBox(
              height: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NesIconButton(
                    onPress: () {
                      if (!_windows.containsKey('nes.txt')) {
                        setState(() {
                          _windows['nes.txt'] = _Window(50, 50, 200, 200);
                        });
                      }
                    },
                    icon: NesIcons.instance.textFile,
                  ),
                  const SizedBox(height: 8),
                  const Text('nes.txt'),
                ],
              ),
            ),
          ),
          for (final entry in _windows.entries)
            Positioned(
              left: entry.value.x,
              top: entry.value.y,
              child: NesDropshadow(
                child: NesWindow(
                  icon: NesIcons.instance.textFile,
                  title: entry.key,
                  width: entry.value.w,
                  height: entry.value.h,
                  onClose: () {
                    setState(() {
                      _windows.remove(entry.key);
                    });
                  },
                  onMove: (delta) {
                    setState(() {
                      entry.value.x += delta.dx;
                      entry.value.y += delta.dy;
                    });
                  },
                  onResize: (delta) {
                    setState(() {
                      entry.value.w += delta.dx;
                      entry.value.h += delta.dy;
                    });
                  },
                  child: const Expanded(
                    child: NesSingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sed leo est. Curabitur volutpat justo non lacus aliquet, et luctus sem facilisis. Aliquam porta dolor eget arcu auctor, nec efficitur justo malesuada. Suspendisse justo ipsum, tempor vel bibendum non, efficitur at massa. Nulla nec nisl magna. Ut mollis arcu sed tempor ultricies. Mauris velit tellus, porttitor ut lacus feugiat, tempus ullamcorper felis. Duis scelerisque, ligula a pulvinar sodales, tortor sapien malesuada nisl, id tristique ligula magna sed odio. Suspendisse iaculis metus ut tempus ultricies. Nunc fringilla diam ut sem viverra eleifend. Fusce sed ligula eget turpis rutrum condimentum. Donec sit amet lacus feugiat, dignissim magna a, imperdiet lorem. Quisque lacinia eleifend neque, quis pulvinar magna pulvinar nec. Nunc justo justo, ullamcorper ac suscipit quis, porta in leo.

Pellentesque sit amet nulla in leo convallis convallis in id lacus. Pellentesque vel massa eu ex suscipit faucibus. Curabitur ornare sollicitudin turpis in finibus. Nulla elementum et nibh quis molestie. Pellentesque velit odio, efficitur in elit nec, egestas gravida ex. Ut feugiat volutpat neque. Donec volutpat quam nec erat suscipit luctus. Nulla semper enim nec ultrices aliquam. Sed eget ornare nunc, sed eleifend felis. Mauris aliquet metus sem, a convallis leo sodales sed. Curabitur vel orci non lorem rhoncus ultricies. Aliquam vitae fringilla elit.

Sed ultrices accumsan turpis, at suscipit erat varius rutrum. Aenean tristique tincidunt ex eget suscipit. Vestibulum lorem augue, tincidunt ut porta eu, posuere id dui. Vestibulum ac justo accumsan, venenatis tortor non, auctor quam. Aliquam sit amet felis eros. Etiam ac enim lacus. Maecenas lacinia laoreet lacus, in fermentum metus laoreet id. Donec molestie ultrices nisi, quis lobortis magna.

Nam eu sodales velit. Donec a malesuada tortor. Vestibulum a turpis ac sem vehicula placerat ut et eros. Donec viverra eros at nibh elementum convallis. Aliquam non pharetra arcu, non venenatis neque. Phasellus eget lorem eget arcu aliquam rhoncus. Morbi et lacinia tellus. Maecenas pharetra tincidunt sem. Sed a quam elit. Pellentesque pretium massa vel quam varius, a porttitor purus rhoncus. Maecenas quis mauris tellus. Nam vel odio a erat vestibulum tincidunt. Donec sit amet nulla ut nibh egestas tristique. Aliquam in rhoncus justo, non varius lectus. Vestibulum lacinia erat ut lorem eleifend bibendum. Vestibulum eu leo eget ante tincidunt feugiat.

Etiam rutrum luctus erat eget ultrices. Ut pharetra dictum libero rhoncus rutrum. Nunc sit amet sapien rhoncus, dignissim quam id, sollicitudin erat. Vestibulum faucibus tristique sem, id bibendum eros accumsan eget. Nam hendrerit viverra risus. Nullam imperdiet turpis nisl, ut porta dolor posuere in. In condimentum fringilla aliquet. Nulla facilisi. Duis mattis tristique quam in scelerisque. Donec sed sollicitudin risus. Pellentesque in sapien vitae enim sollicitudin sodales nec eu magna. Phasellus lacus est, euismod fringilla nisl eu, dignissim vestibulum ante.''',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
