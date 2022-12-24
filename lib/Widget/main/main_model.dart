import 'package:flutter/cupertino.dart';
import 'package:restaurant/inmat/auth/inmat_auth.dart';
import 'package:restaurant/inmat/inmat_api/restaurant/get_home.dart';

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
    InMatGetHome restaurant = InMatGetHome();
    try{
      Map<String, dynamic> map = await restaurant.getHome();
      // print(map);
      json = map;
      complete = true;

      banners = json['bannerList'] ;
      toDayRecommends = json['todayRecommendList'] ;
      recentReviews = json['recentReviewList'];
      restaurants = json['restaurantList'] ;
      print(toDayRecommends);
    }catch(e){
      print(e);
    }



    // print(banners);
    // print(toDayRecommends);
    // print(recentReviews);
    // print(restaurants);



    notifyListeners();
  }
}
