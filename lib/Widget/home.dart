import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text("오늘 이건 어때요?"),
              decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            ),
            Text("00이 선호하는 음식"),
            Text("최근 일주일 인기 음식점"),
            Text("최근 남겨진 리뷰"),
            Text("음식점 이름"),
            Text("음식점 이름"),
          ],
        ),
      ),
    );
  }
}
