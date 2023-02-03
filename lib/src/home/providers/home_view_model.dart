import 'package:flutter/cupertino.dart';


import '../model/banner_model.dart';
import '../model/restaurant_model.dart';
import '../model/review_model.dart';
import '../model/today_model.dart';
import '../service/data.dart';

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
      HomeModelClas dataRemodel = await HomeModelClas.run();
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
