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

  // static List<String> RestaurantName = [
  //   'sample1',
  //   'sample2',
  //   'sample3',
  // ];

  // static List<String> RestaurantImagePath = [
  //   'images/sample1.jpg',
  //   'images/sample2.jpg',
  //   'images/sample3.jpg',
  // ];

  // final List<infinityRestaurant> RestaurantData = List.generate(
  //     RestaurantName.length,
  //         (index) => infinityRestaurant(
  //         RestaurantName[index], RestaurantImagePath[index]));

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
      body: ListView(children: [
        ToDayWidget(),
        FavorateFood(),
        BestFood(),
      ]),
    );
  }
}




class FoodWidget extends StatelessWidget {
  const FoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 150,
            height: 100,
            color: Colors.grey,
          ),
          Text("음식 이름"),
        ],
      ),
    );
  }
}

class ToDayWidget extends StatelessWidget {
  //const
  ToDayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "오늘 이거 어때요?",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FavorateFood extends StatelessWidget {
  //const
  FavorateFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "남성이 좋아하는 음식",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BestFood extends StatelessWidget {
  //const
  BestFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "최근 일주일 인기 음식점",
            style: TextStyle(fontSize: 24),
          ),
          Container(
            height: 160,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FoodWidget(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
