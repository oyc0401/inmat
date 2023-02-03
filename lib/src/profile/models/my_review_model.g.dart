// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyReviewModel _$$_MyReviewModelFromJson(Map<String, dynamic> json) =>
    _$_MyReviewModel(
      contents: json['contents'] as String,
      createdAt: json['createdAt'] as String,
      imgUrlList: json['imgUrlList'] as List<dynamic>,
      ratingStar: json['ratingStar'] as int,
      restaurantId: json['restaurantId'] as int,
      restaurantName: json['restaurantName'] as String,
      reviewId: json['reviewId'] as int,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$$_MyReviewModelToJson(_$_MyReviewModel instance) =>
    <String, dynamic>{
      'contents': instance.contents,
      'createdAt': instance.createdAt,
      'imgUrlList': instance.imgUrlList,
      'ratingStar': instance.ratingStar,
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'reviewId': instance.reviewId,
      'userId': instance.userId,
    };
