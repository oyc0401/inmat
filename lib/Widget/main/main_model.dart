import 'package:flutter/cupertino.dart';
import 'package:restaurant/inmat/auth/inmat_auth.dart';
import 'package:restaurant/inmat/inmat_api/restaurant/get_restaurant.dart';

class HomeModel extends ChangeNotifier {
  HomeModel() {
    init();
  }

  bool complete = false;

  Map json = {'dsad': "rrfv"};

  List banners = [];
  List toDayRecommends = [];
  List recentReviews = [];
  List restaurants = [];

  init() async {
    InMatGetRestaurant restaurant = InMatGetRestaurant();
    Map<String, dynamic> map = await restaurant.getRestaurant();
    // print(map);
    json = map;
    complete = true;

    banners = json['bannerList'] ;
    toDayRecommends = json['todayRecommendList'] ;
    recentReviews = json['recentReviewList'];
    restaurants = json['restaurantList'] ;

    // print(banners);
    // print(toDayRecommends);
    // print(recentReviews);
    // print(restaurants);



    notifyListeners();
  }
}
