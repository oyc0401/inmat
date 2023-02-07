import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/auth/domain/model/profile_model.dart';
import 'package:inmat/inmat/auth/domain/model/token_model.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/home/model/banner_model.dart';
import 'package:inmat/src/home/model/home_model.dart';
import 'package:inmat/src/home/model/home_model_json.dart';
import 'package:inmat/src/home/model/restaurant_model.dart';
import 'package:inmat/src/home/model/review_model.dart';
import 'package:inmat/src/home/model/today_model.dart';
import 'package:inmat/src/profile/models/my_favorite_model.dart';
import 'package:inmat/src/profile/models/my_review_model.dart';
import 'package:inmat/src/profile/models/posts_model.dart';
import 'package:inmat/src/search/domain/models/recent_model.dart';

void main() {


  group("restaurant api 테스트", () {
    late Token testToken;

    const String testId = "test123";
    const String testPassword = "qwe12345&&";
    const String testDeviceIdentifier = "dart_pad";

    setUpAll(() async {
      // 로그인
      Map<String, dynamic> json = await InMatApi.auth.login(
        id: testId,
        password: testPassword,
        deviceIdentifier: testDeviceIdentifier,
      );

      testToken = Token.fromJson(json);
    });

    test("홈화면 불러오기", () async {
      Map<String, dynamic> json =
          await InMatApi.restaurant.getHome(testToken.accessToken);

      HomeModelJson jsonModel = HomeModelJson.fromJson(json);

      List<BannerModel> banners =
          jsonModel.bannerList.map((e) => BannerModel.fromJson(e)).toList();

      List<TodayModel> todays = jsonModel.todayRecommendList
          .map((e) => TodayModel.fromJson(e))
          .toList();

      List<ReviewModel> reviews = jsonModel.recentReviewList
          .map((e) => ReviewModel.fromJson(e))
          .toList();

      List<RestaurantModel> restaurants = jsonModel.restaurantList
          .map((e) => RestaurantModel.fromJson(e))
          .toList();

    });

// Registers a function to be run before tests
    setUp(() {});

// Registers a function to be run after tests
    tearDown(() {});

// Registers a function to be run once after all tests
    tearDownAll(() {});
  });
}
