import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("공지사항"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("버전: 0.0.1"),
            Text("마지막 업데이트: 2023.01.18"),
          ],
        ),
      ),
    );
  }
}
