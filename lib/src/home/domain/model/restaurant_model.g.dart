// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantModel _$$_RestaurantModelFromJson(Map<String, dynamic> json) =>
    _$_RestaurantModel(
      restaurantId: json['restaurantId'] as int,
      profileImgUrl: json['profileImgUrl'] as String,
      restaurantName: json['restaurantName'] as String,
      address: json['address'] as String,
      averageStar: (json['averageStar'] as num).toDouble(),
      countReview: json['countReview'] as int,
      averagePrice: json['averagePrice'] as int,
      complexity: json['complexity'] as int,
      restaurantType: json['restaurantType'] as String,
      userHeart: json['userHeart'] as bool,
    );

Map<String, dynamic> _$$_RestaurantModelToJson(_$_RestaurantModel instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'profileImgUrl': instance.profileImgUrl,
      'restaurantName': instance.restaurantName,
      'address': instance.address,
      'averageStar': instance.averageStar,
      'countReview': instance.countReview,
      'averagePrice': instance.averagePrice,
      'complexity': instance.complexity,
      'restaurantType': instance.restaurantType,
      'userHeart': instance.userHeart,
    };
