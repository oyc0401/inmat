import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> controller = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    StreamController<int> controller = StreamController<int>();
    return Scaffold(body: Column(
      children: [
        Expanded(
          child: FortuneWheel(
            onFling: () {
              controller.add(1);
            },

            selected: controller.stream,
            items: [
              FortuneItem(child: Text('Han Solo')),
              FortuneItem(child: Text('Yoda')),
              FortuneItem(child: Text('Obi-Wan Kenobi')),
            ],
          ),
        ),
        CupertinoButton(child: Text("돌리기"), onPressed: (){
          controller.add(1);

        })
      ],
    ),);
  }
}
