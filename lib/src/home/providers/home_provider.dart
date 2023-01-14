import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/home/domain/service/data.dart';

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
    try {
      DataRemodel dataRemodel = await DataRemodel.run();
      print(dataRemodel.banners);

      Map<String, dynamic> map = await InMatApi.restaurant.getHome();
      // print(map);
      json = map;
      complete = true;

      banners = json['bannerList'];
      toDayRecommends = json['todayRecommendList'];
      recentReviews = json['recentReviewList'];
      restaurants = json['restaurantList'];
      print(restaurants);
    } catch (e) {
      print(e);
    }

    // print(banners);
    // print(toDayRecommends);
    // print(recentReviews);
    // print(restaurants);

    notifyListeners();
  }
}
