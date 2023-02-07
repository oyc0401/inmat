import 'package:flutter/material.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantProvider(this.id) {
    init(id);
  }

  Map map = {};

  bool complete = false;
  int id;

  bool heart = false;
  bool clickHeart = false;

  // String profileUrl = '';
  String name = '';
  List? images = [];
  List menus = [];
  String address = '';

  String contactNumber = '';
  double averageStar = 0.0;
  int reviewCount = 0;
  int heartCont = 0;
  int averagePrice = 0;
  int complexity = 1;
  String type = '';
  List reviews = [];
  double latitude = 0.0;
  double longitude = 0.0;

  like() {
    clickHeart = true;
    heart = heart ? false : true;
    notifyListeners();
  }

  postHeart() async {
    // if (heart && clickHeart) {
    //   await InMatApi.restaurant.setHeart(
    //       id, InMatAuth.instance.currentUser!.token);
    // } else if (!heart && clickHeart) {
    //   await InMatApi.restaurant.deleteHeart(
    //       id, InMatAuth.instance.currentUser!.token);
    // }
  }

  init(int id) async {
    print(id);
    // map = await InMatApi.restaurant.getRestaurant(
    //     id, InMatAuth.instance.currentUser!.token);
    map = serverMap;
    complete = true;
    print(map);

    name = map['restaurantName'];
    images = map['restaurantImgList'];
    menus = map['menuList'];
    reviews = map['reviewList'];
    address = map['address'];
    heart = map['userHeart'];
    contactNumber = map['contactNumber'];
    averageStar = map['averageStar'];
    reviewCount = map['countReview'];
    heartCont = map['countHeart'];
    averagePrice = map['averagePrice'];
    complexity = map['complexity'];
    type = map['restaurantType'];

    notifyListeners();
  }
}

Map serverMap = {
  'restaurantId': 3,
  'profileImgUrl': ' ',
  'restaurantName': '미식당',
  'restaurantImgList': [],
  'menuList': [
    {'categoryId': 8, 'menuName': '알리오 올리오', 'price': 8000},
    {'categoryId': 9, 'menuName': '목살 필라프', 'price': 8000},
    {'categoryId': 10, 'menuName': '토마토 피자', 'price': 9000},
    {'categoryId': 11, 'menuName': '까르보나라', 'price': 6000}
  ],
  'address': '미추홀구 인하로 1번길',
  'latitude': 36.0,
  'longitude': 36.0,
  'userHeart': false,
  'contactNumber': 010 - 1234 - 5678,
  'averageStar': 3.0,
  'countReview': 3,
  'countHeart': 0,
  'averagePrice': 7750,
  'complexity': 1,
  'restaurantType': 'FOOD',
  'reviewList': []
};
