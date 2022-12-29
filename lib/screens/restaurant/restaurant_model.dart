import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/restaurant/get_restaurant.dart';

class RestaurantModel with ChangeNotifier {
  RestaurantModel(this.id) {
    init(id);
  }

  Map map = {};

  bool complete = false;
  int id;

  // String profileUrl = '';
  String name = '';
  List? images = [];
  List menus = [];
  String address = '';
  bool heart = false;
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

  init(int id) async {
    print(id);
    InMatGetRestaurant getRestaurant = InMatGetRestaurant();

    map = await getRestaurant.getRestaurant(id);
    complete = true;
    print(map);

    name = map['restaurantName'];
    images = map['restaurantImgList'];
    menus = map['menuList'];
    reviews=map['reviewList'];
    address = map['address'];
    heart = map['userHeart'];
    contactNumber = map['contactNumber'];
    averageStar = map['averageStar'];
    reviewCount = map['countReview'];
    heartCont=map['countHeart'];
    averagePrice=map['averagePrice'];
    complexity=map['complexity'];
    type=map['restaurantType'];





    notifyListeners();
  }
}