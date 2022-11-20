import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/AuthCheck.dart';
import 'package:restaurant/inmat/auth/InMatToken.dart';
import 'package:restaurant/inmat/auth/inMatAuth.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'Widget/NavigatePage.dart';
import 'Widget/home.dart';

void main() async {
  // DB에서 유저 정보 가져오기
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  InMatToken to = InMatToken();
  await to.downLoad();
  await InMatAuth.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: AuthCheck(),
    );
  }
}
