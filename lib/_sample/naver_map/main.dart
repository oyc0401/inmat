import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'naver.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '네이버 맵',
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CupertinoButton(
              child: Text("이동"),
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (context) => NaverMapPage()));
              }),
        ],
      ),
    );
  }
}
