import 'package:flutter/material.dart';

import 'dart:math' as math;
import 'dart:math';

void main() => runApp(const CustomPage());

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  double _radius = 50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dsa"),
        ),
        body: ListView(
          children: [
            for (int i = 0; i <= 10; i++)
              Container(
                margin: EdgeInsets.all(8.0),
                color: i%2==0?Colors.yellow:Colors.amber,
                height: 60,
                child: Center(
                    child: Text(
                  "$i",
                  style: TextStyle(fontSize: 24),
                )),
              ),
          ],
        ),
        floatingActionButton: AnimeCircle(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class AnimeCircle extends StatefulWidget {
  const AnimeCircle({Key? key}) : super(key: key);

  @override
  State<AnimeCircle> createState() => _AnimeCircleState();
}

class _AnimeCircleState extends State<AnimeCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // 애니메이션 컨트롤러 초기화
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // 300 밀리세컨드, 0.3 초간 실행
    );

    final Animation<double> curve =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
    _animation = Tween<double>(begin: 40, end: 300).animate(curve);

    // _animation.addListener(() {
    //   print("리슨");
    //   setState(() {});
    // });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool closed = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (closed) {
          print("열기");
          _animationController.forward();
          closed = false;
        } else {
          print("닫기");
          _animationController.reverse();
          closed = true;
        }
      },
      child: Container(
        height: 80,
        width: 80,
        child: Center(
          child: CustomPaint(
            painter: MyPainter(listenable: _animation),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final Animation listenable;

  MyPainter({required this.listenable}) : super(repaint: listenable);

  final double strokeWidth = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    final buttonPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    //  ..style = PaintingStyle.stroke; //important set stroke style

    // Path path = Path()
    //   ..lineTo(listenable.value, listenable.value)
    //   ..close();
    canvas.drawCircle(Offset(0.0, 0.0), listenable.value, paint);
    canvas.drawCircle(Offset(0.0, 0.0), 40, buttonPaint);
    // canvas.drawCircle(Offset(0.0, 0.0), listenable.value, paint);
    //  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
