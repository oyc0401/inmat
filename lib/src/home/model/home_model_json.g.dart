// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HomeModelJson _$$_HomeModelJsonFromJson(Map<String, dynamic> json) =>
    _$_HomeModelJson(
      bannerList: (json['bannerList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      recentReviewList: (json['recentReviewList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      restaurantList: (json['restaurantList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      todayRecommendList: (json['todayRecommendList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_HomeModelJsonToJson(_$_HomeModelJson instance) =>
    <String, dynamic>{
      'bannerList': instance.bannerList,
      'recentReviewList': instance.recentReviewList,
      'restaurantList': instance.restaurantList,
      'todayRecommendList': instance.todayRecommendList,
    };
