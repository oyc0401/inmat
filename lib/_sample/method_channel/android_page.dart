import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'view.dart';

class AndroidPage extends StatefulWidget {
  const AndroidPage({Key? key}) : super(key: key);

  @override
  State<AndroidPage> createState() => _AndroidPageState();
}

class _AndroidPageState extends State<AndroidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("안드로이드 네이티브 코드 사용"),
      ),
      body: Column(

        children: [
          CupertinoButton(
              child: Text("안드로이드 뷰 이동"),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => HomePage(),
                    ));
              }),
          CupertinoButton(
              child: Text("안드로이드 위젯 이동"),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => AndroidWidget(),
                    ));
              }),
        ],
      ),
    );
  }
}
