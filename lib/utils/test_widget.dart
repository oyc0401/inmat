import 'package:flutter/material.dart';

/// 위젯 하나를 테스트해 볼 수 있는 도구
///
/// ``` dart
/// void main() =>
///     TestWidget.run(
///         Container(width: 30, height: 10, color: Colors.red);
///     );
/// ```
class TestWidget {
  TestWidget._();

  /// 테스트 할 앱 실행하기
  static run(Widget widget, [String? title]) {
    runApp(BasicApp(
      body: widget,
      title: title ?? "",
    ));
  }
}

class BasicApp extends StatelessWidget {
  const BasicApp({
    Key? key,
    required this.body,
    required this.title,
  }) : super(key: key);
  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: body,
      ),
    );
  }
}
