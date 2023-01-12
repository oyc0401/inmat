import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

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

    try{
      Map<String, dynamic> map =await InMatApi.restaurant.getHome();
      // print(map);
      json = map;
      complete = true;

      banners = json['bannerList'] ;
      toDayRecommends = json['todayRecommendList'] ;
      recentReviews = json['recentReviewList'];
      restaurants = json['restaurantList'] ;
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
