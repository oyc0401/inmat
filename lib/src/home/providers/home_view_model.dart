import 'package:flutter/cupertino.dart';


import '../domain/model/banner_model.dart';
import '../domain/model/restaurant_model.dart';
import '../domain/model/review_model.dart';
import '../domain/model/today_model.dart';
import '../domain/service/data.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel() {
    init();
  }

  bool complete = false;

  List<BannerModel> banners = [];
  List<TodayModel> toDayRecommends = [];
  List<ReviewModel> recentReviews = [];
  List<RestaurantModel> restaurants = [];

  init() async {
    try {
      HomeModel dataRemodel = await HomeModel.run();
      banners=dataRemodel.banners;
      toDayRecommends=dataRemodel.todays;
      recentReviews=dataRemodel.reviews;
      restaurants=dataRemodel.restaurants;

      complete = true;

    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
