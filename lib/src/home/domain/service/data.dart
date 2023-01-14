import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../model/banner_model.dart';
import '../model/restaurant_model.dart';

class DataRemodel {
  DataRemodel._(this.json);

  Map<String, dynamic> json;

  static Future<DataRemodel> run() async {
    Map<String, dynamic> map = await InMatApi.restaurant.getHome();
    return DataRemodel._(map);
  }

  List<BannerModel> get banners {
    List list = json['bannerList'];
    List<BannerModel> result =
        list.map((data) => BannerModel.fromJson(data)).toList();

    return result;
  }

  void running() async {
    // toDayRecommends = json['todayRecommendList'];
    // recentReviews = json['recentReviewList'];
    // restaurants = json['restaurantList'];
    // print(restaurants);

    RestaurantModel restaurantModel = RestaurantModel.fromJson(json);
  }
}
