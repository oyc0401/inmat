import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';

class NaverMapPage extends StatefulWidget {
  const NaverMapPage({Key? key}) : super(key: key);

  @override
  State<NaverMapPage> createState() => _NaverMapPageState();
}

class _NaverMapPageState extends State<NaverMapPage> {
  Completer<NaverMapController> _controller = Completer();
  MapType _mapType = MapType.Basic;

  @override
  Widget build(BuildContext context) {
    double longitude = 126.65667;
    double latitude = 37.45132;

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
                Marker(markerId: '가게1', position: LatLng(latitude, longitude),width: 30,height: 40),

              ],
              minZoom: 13,
              mapType: _mapType,
            ),
          ),
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
