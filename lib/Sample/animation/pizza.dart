import 'package:flutter/material.dart';
import 'dart:math' as Math;

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Container(
            width: 100,
            height: 100,
            child: CircleView())),
      ),
    );
  }
}

class CircleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
      Colors.red,
      Colors.blue,
      Colors.orange,
      Colors.indigo,
      Colors.deepOrange,
      Colors.green,
    ];
    double anglePerSlice = 2 * Math.pi / colors.length;

    return Stack(
      fit: StackFit.expand,
      children: [
        for (int i = 0; i < colors.length; i++)
          Transform.rotate(
            angle: i * anglePerSlice,
            alignment: Alignment.topLeft,
            child: CustomPaint(
              painter: CircleSlicePainter(
                anglePerSlice,
                colors[i],
              ),
            ),
          )
      ],
    );
  }
}

class CircleSlicePainter extends CustomPainter {
  final double angle;
  final Color color;

  const CircleSlicePainter(this.angle, this.color);

  Path buildSlicePath(double radius, double angle) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(radius, 0)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(0, 0),
          radius: radius,
        ),
        0,
        angle,
        false,
      )
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = Math.min(size.width, size.height);
    final path = buildSlicePath(radius, angle);
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CircleSliceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleSlicePainter(Math.pi / 2, Colors.blue),
    );
  }
}
