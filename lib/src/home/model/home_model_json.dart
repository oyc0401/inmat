import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_model_json.g.dart';

part 'home_model_json.freezed.dart';

// HomeModel
// home_model_json_json

// $ flutter pub run build_runner build

@freezed
class HomeModelJson with _$HomeModelJson {
  factory HomeModelJson({
    required List<Map<String, dynamic>> bannerList,
    required List<Map<String, dynamic>> recentReviewList,
    required List<Map<String, dynamic>> restaurantList,
    required List<Map<String, dynamic>> todayRecommendList,
  }) = _HomeModelJson;

  factory HomeModelJson.fromJson(Map<String, dynamic> json) =>
      _$HomeModelJsonFromJson(json);
}
