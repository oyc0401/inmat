import 'package:flutter/material.dart';
import 'package:restaurant/inmat/inmat_api/restaurant/get_restaurant.dart';

class RestaurantModel with ChangeNotifier {
  RestaurantModel(this.id) {
    init(id);
  }

  Map map = {};

  bool complete = false;
  int id;
  String profileUrl = '';
  String name = '';
  List images = [];
  List menus = [];
  String address = '';
  bool heartt = false;
  String contactNumber = '';
  double averageStar = 0.0;
  int reviewCount = 0;
  int heartCont = 0;
  double averagePrice = 0.0;
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
    notifyListeners();
  }
}
