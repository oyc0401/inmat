import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant/Widget/infinityRestaurant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<Widget> list=[ ToDayWidget(), ToDayWidget()];  ************

  static List<String> RestaurantName = [
    'sample1',
    'sample2',
    'sample3',
  ];

  static List<String> RestaurantImagePath = [
    'images/sample1.jpg',
    'images/sample2.jpg',
    'images/sample3.jpg',
  ];

  final List<infinityRestaurant> RestaurantData = List.generate(
      RestaurantName.length,
          (index) => infinityRestaurant(
          RestaurantName[index], RestaurantImagePath[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("인맛"),
      ),
      drawer: Drawer(
        child: Center(
          child: Text("컨텐츠"),
        ),
      ),
      drawerEdgeDragWidth: 20,
      drawerEnableOpenDragGesture: true,
      body:  ListView.builder(
        itemCount: RestaurantData.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(
                  RestaurantData[index].name
              ),
              leading: SizedBox(
                height: 50, width: 50, child: Image.asset(RestaurantData[index].imgPath),
              ),
            ),
          );
        },
      ),

      // ListView(
      //   children: [
      //     // Row(children: list,),          *************
      //     ToDayWidget(),
      //     // ToDayWidget(), ToDayWidget(), ToDayWidget(), ToDayWidget(), ToDayWidget(),
      //   ],
      // ),
    );
  }
}

class ToDayWidget extends StatelessWidget {
  //const
  ToDayWidget({Key? key}) : super(key: key);

  static List<String> RestaurantName = [
    'sample1',
    'sample2',
    'sample3',
  ];

  static List<String> RestaurantImagePath = [
    'images/sample1.jpg',
    'images/sample2.jpg',
    'images/sample3.jpg',
  ];

  final List<infinityRestaurant> RestaurantData = List.generate(
      RestaurantName.length,
      (index) => infinityRestaurant(
          RestaurantName[index], RestaurantImagePath[index]));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: ,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("오늘 이건 어때요?")),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          Container(
            height: 1.0,
            width: 500,
            color: Colors.black,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            child: Image.asset('assets/images/sample1.jpg'),
          ),
          Container(
            child: Center(child: Text(" 갈비탕")),
            decoration: BoxDecoration(color: Colors.grey[300]),
          ),
          Text("00이 선호하는 음식"),
          Text("최근 일주일 인기 음식점"),
          Text("최근 남겨진 리뷰"),
          // ListView.builder(
          //     itemCount: RestaurantData.length,
          //     itemBuilder: (context, index){
          //       return Card(
          //         child: ListTile(
          //           title: Text(
          //             RestaurantData[index].name
          //           ),
          //           leading: SizedBox(
          //             height: 50, width: 50, child: Image.asset(RestaurantData[index].imgPath),
          //           ),
          //         ),
          //       );
          //     },
          // ),
          Text("음식점 이름"),
          Text("음식점 이름"),
        ],
      ),
    );
  }
}

