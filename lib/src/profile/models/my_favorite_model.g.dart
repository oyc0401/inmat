// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_favorite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyFavoriteModel _$$_MyFavoriteModelFromJson(Map<String, dynamic> json) =>
    _$_MyFavoriteModel(
      address: json['address'] as String,
      averageStar: (json['averageStar'] as num).toDouble(),
      countHeart: json['countHeart'] as int,
      heartId: json['heartId'] as int,
      imgUrl: json['imgUrl'] as String?,
      restaurantId: json['restaurantId'] as int,
      restaurantName: json['restaurantName'] as String,
      restaurantType: json['restaurantType'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$$_MyFavoriteModelToJson(_$_MyFavoriteModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'averageStar': instance.averageStar,
      'countHeart': instance.countHeart,
      'heartId': instance.heartId,
      'imgUrl': instance.imgUrl,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'restaurantType': instance.restaurantType,
      'userId': instance.userId,
    };
