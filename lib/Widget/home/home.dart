import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // List<widget> list=[ ToDayWidget(), ToDayWidget()];  ************

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
        title: Text("인맛 InMAt"),
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       SizedBox(
      //         height: 100 ,
      //         child: const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //           ),
      //           child: Text('카테고리'),
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('밥',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      //         dense: true,
      //         visualDensity: VisualDensity(vertical: -3),),
      //       ListTile(
      //         title: const Text('음식명'),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         title: const Text('음식명'),
      //         onTap: () {
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('음식명'),
      //         onTap: () {
      //         },
      //       ),
      //       ListTile(
      //         title: const Text('음식명'),
      //         onTap: () {
      //         },
      //       ),
      //
      //       ListTile(title: Text('술',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      //         dense: true,
      //         visualDensity: VisualDensity(vertical: -3),),
      //       ListTile(
      //         title: const Text('칵테일 바'),
      //         onTap: () {
      //         },
      //       ),ListTile(
      //         title: const Text('칵테일 바'),
      //         onTap: () {
      //         },
      //       ),ListTile(
      //         title: const Text('칵테일 바'),
      //         onTap: () {
      //         },
      //       ),ListTile(
      //         title: const Text('칵테일 바'),
      //         onTap: () {
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // ^ 카테고리 속성
      drawerEdgeDragWidth: 20,
      drawerEnableOpenDragGesture: true,
      body: ListView(children: [
        FoodForm(title: "오늘 이건 어때요?"),
        FoodForm(title: "남성이 선호하는 음식"),
        FoodForm(title: "최근 일주일 인기 음식점"),
        Column(
          children: [
            Container(margin: EdgeInsets.all(5),child: Text('최근남겨진 리뷰',style: TextStyle(fontSize: 24 ,)),),
            Container(padding: EdgeInsets.all(5),
              height:1.0,
              width:350.0,
              color:Colors.black,), // 구분선 긋기
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(),
            ),
            Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FoodReviewWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FoodReviewWidget(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FoodReviewWidget(),
            ),
            Container(padding: EdgeInsets.all(5),
              height:1.0,
              width:350.0,
              color:Colors.black,), // 구분선 긋기
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: infinityRestaurant(
              ),


            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: infinityRestaurant(),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: infinityRestaurant(),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: infinityRestaurant(),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: infinityRestaurant(),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: infinityRestaurant(),
            ),Padding(
              padding: const EdgeInsets.all(8.0),
              child: infinityRestaurant(),
            ),
          ],
        ),
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

class FoodForm extends StatelessWidget {
  //const
  FoodForm({Key? key, required this.title}) : super(key: key);

  String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Text(
            title,
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

class FoodReviewWidget extends StatelessWidget {
  const FoodReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 150,
            height: 100,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("      음식점 이름"),
              Row(
                children: [
                  Text("      별점"),SizedBox(width: 50,),Text(" 평점"),
                ],
              ),
              Text("      리뷰 내용이 들어갈 자리 입니다."),
            ],
          ),
        ],
      ),
    );
  }
}

class infinityRestaurant extends StatefulWidget {
  const infinityRestaurant({Key? key}) : super(key: key);

  @override
  State<infinityRestaurant> createState() => _infinityRestaurantState();
}

class _infinityRestaurantState extends State<infinityRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: 150,
            height: 100,
            // color: Colors.grey,

            decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: AssetImage('assets/images/gosu.jpg'),
                  fit: BoxFit.cover, ),

            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("      음식점 이름"), SizedBox(width: 50,), Icon(Icons.favorite), Text('30'),
                ],
              ), Row(
                children: [
                  Text("      별점"),SizedBox(width: 50,),Text("평균가격: 8000원"),
                ],
              ),

              Text("      리뷰 내용이 들어갈 자리 입니다."),
            ],
          ),
        ],
      ),
    );
  }
}
