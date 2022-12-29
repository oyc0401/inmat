import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class NaverMapPage extends StatefulWidget {
  const NaverMapPage({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);
  final double longitude;
  final double latitude;

  @override
  State<NaverMapPage> createState() => _NaverMapPageState();
}

class _NaverMapPageState extends State<NaverMapPage> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;
  late double longitude;
  late double latitude;

  @override
  initState() {
    super.initState();
    longitude = widget.longitude;
    latitude = widget.latitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NaverMap Test')),
      body: Column(
        children: [
          // Container(
          //   height: 400,
          //   color: Colors.blueGrey,
          // ),
          Container(
            height: 300,
            child: NaverMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(latitude, longitude), zoom: 17),
              // scrollGestureEnable:false,
              // rotationGestureEnable:false,
              //zoomGestureEnable:false,
              onMapCreated: onMapCreated,
              markers: [
                Marker(
                    markerId: '가게1',
                    position: LatLng(latitude, longitude),
                    width: 30,
                    height: 40),
              ],

              minZoom: 13,
              mapType: _mapType,
            ),
          ),

          Text('latitude: ${latitude.toStringAsPrecision(7)}, longitude: ${longitude.toStringAsPrecision(8)}'),
          CupertinoButton(
              child: Text("위쪽"),
              onPressed: () {
                setState(() {
                  latitude += 0.00001;
                });
              }),
          CupertinoButton(
              child: Text("아래쪽"),
              onPressed: () {
                setState(() {
                  latitude -= 0.00001;
                });
              }),
          CupertinoButton(
              child: Text("왼쪽"),
              onPressed: () {
                setState(() {
                  longitude -= 0.00001;
                });
              }),
          CupertinoButton(
              child: Text("오른쪽"),
              onPressed: () {
                setState(() {
                  longitude += 0.00001;
                });
              }),
          // Container(
          //   height: 400,
          //   color: Colors.blueGrey,
          // ),
        ],
      ),
    );
  }

  void onMapCreated(NaverMapController controller) {
    if (_controller.isCompleted) _controller = Completer();
    _controller.complete(controller);
  }
}
