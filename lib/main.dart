import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/AuthCheck.dart';
import 'package:restaurant/inmat/user/inMatUser.dart';
import 'package:restaurant/inmat/user/instance/InMatInstance.dart';

import 'Widget/NavigatePage.dart';
import 'Widget/home.dart';

void main() {
  //InMatUser.downLoad();
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

