import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../model/banner_model.dart';
import '../model/restaurant_model.dart';
import '../model/review_model.dart';
import '../model/today_model.dart';

class HomeModelClas {
  HomeModelClas._(this._json);

  Map<String, dynamic> _json;

  static Future<HomeModelClas> run() async {
    Map<String, dynamic> map = await InMatApi.restaurant.getHome(InMatAuth.instance.currentUser!.token);
    return HomeModelClas._(map);
  }

  List<BannerModel> get banners {
    return [
      for (dynamic data in _json['bannerList']) BannerModel.fromJson(data)
    ];
  }

  List<TodayModel> get todays {
    return [
      for (dynamic data in _json['todayRecommendList']) TodayModel.fromJson(data)
    ];
  }

  List<ReviewModel> get reviews {
    return [
      for (dynamic data in _json['recentReviewList']) ReviewModel.fromJson(data)
    ];
  }

  List<RestaurantModel> get restaurants {
    return [
      for (dynamic data in _json['restaurantList']) RestaurantModel.fromJson(data)
    ];
  }
}
