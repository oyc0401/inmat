import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';
import 'package:inmat/src/home/model/home_model_json.dart';
import 'package:inmat/utils/on_resign_in.dart';

import '../model/banner_model.dart';
import '../model/restaurant_model.dart';
import '../model/review_model.dart';
import '../model/today_model.dart';
import '../service/data.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel(BuildContext context) {
    init(context);
  }

  bool complete = false;

  List<BannerModel> banners = [];
  List<TodayModel> toDayRecommends = [];
  List<ReviewModel> recentReviews = [];
  List<RestaurantModel> restaurants = [];

  init(BuildContext context) async {
    InmatApi.restaurant.getHome(context).execute((json) {
      HomeModelJson jsonModel = HomeModelJson.fromJson(json);

      banners =
          jsonModel.bannerList.map((e) => BannerModel.fromJson(e)).toList();

      toDayRecommends = jsonModel.todayRecommendList
          .map((e) => TodayModel.fromJson(e))
          .toList();

      recentReviews = jsonModel.recentReviewList
          .map((e) => ReviewModel.fromJson(e))
          .toList();

      restaurants = jsonModel.restaurantList
          .map((e) => RestaurantModel.fromJson(e))
          .toList();

      complete = true;

      notifyListeners();
    });
  }
}
