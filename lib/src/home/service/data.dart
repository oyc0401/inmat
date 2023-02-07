import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';

import '../model/banner_model.dart';
import '../model/home_model_json.dart';
import '../model/restaurant_model.dart';
import '../model/review_model.dart';
import '../model/today_model.dart';

class HomeData {
  HomeData._({
    required this.banners,
    required this.reviews,
    required this.restaurants,
    required this.todays,
  });

  List<BannerModel> banners;
  List<TodayModel> todays;
  List<ReviewModel> reviews;
  List<RestaurantModel> restaurants;

  static Future<HomeData> get() async {
    Map<String, dynamic> json = await InmatApi.restaurant.getHome();

    HomeModelJson jsonModel = HomeModelJson.fromJson(json);

    List<BannerModel> banners =
        jsonModel.bannerList.map((e) => BannerModel.fromJson(e)).toList();

    List<TodayModel> todays = jsonModel.todayRecommendList
        .map((e) => TodayModel.fromJson(e))
        .toList();

    List<ReviewModel> reviews =
        jsonModel.recentReviewList.map((e) => ReviewModel.fromJson(e)).toList();

    List<RestaurantModel> restaurants = jsonModel.restaurantList
        .map((e) => RestaurantModel.fromJson(e))
        .toList();

    return HomeData._(
        banners: banners,
        todays: todays,
        reviews: reviews,
        restaurants: restaurants);
  }
}
