// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModel _$$_ReviewModelFromJson(Map<String, dynamic> json) =>
    _$_ReviewModel(
      restaurantId: json['restaurantId'] as int,
      reviewId: json['reviewId'] as int,
      imgUrl: json['imgUrl'] as String?,
      restaurantName: json['restaurantName'] as String,
      nickName: json['nickName'] as String,
      ratingStar: json['ratingStar'] as int,
      contents: json['contents'] as String,
    );

Map<String, dynamic> _$$_ReviewModelToJson(_$_ReviewModel instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'reviewId': instance.reviewId,
      'imgUrl': instance.imgUrl,
      'restaurantName': instance.restaurantName,
      'nickName': instance.nickName,
      'ratingStar': instance.ratingStar,
      'contents': instance.contents,
    };
