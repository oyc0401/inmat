
import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class RestaurantModel with ChangeNotifier {
  RestaurantModel(this.id) {
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
    if (heart && clickHeart) {
      await InMatApi.restaurant.setHeart(id);
    } else if (!heart && clickHeart) {
      await InMatApi.restaurant.deleteHeart(id);
    }
  }

  init(int id) async {
    print(id);
    map = await InMatApi.restaurant.getRestaurant(id);
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
