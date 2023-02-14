import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(child: SpinnerDetector()),
      ),
    );
  }
}

class SpinnerDetector extends HookWidget {
  SpinnerDetector({Key? key}) : super(key: key);

  GlobalKey _containerKey = GlobalKey();

  Offset _getOffset() {
    assert(_containerKey.currentContext != null);
    final RenderBox renderBox =
        _containerKey.currentContext!.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    return offset;
  }

  late Offset center;

  @override
  Widget build(BuildContext context) {
    final angle = useState(0.0);
    return GestureDetector(
      key: _containerKey,
      onPanStart: (drag) {
        print(drag);
        Offset start = _getOffset();
        center = Offset(start.dx + 150, start.dy + 150);

      },
      onPanUpdate: (drag) {
        print(drag);
        angle.value += 0.01;
      },
      child: Transform.rotate(
        angle: angle.value,
        child: Container(
          width: 300,
          height: 300,
          decoration: const BoxDecoration(
            color: Colors.red,
            // shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              "룰렛",
              style: TextStyle(fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
