// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_thumb_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostThumbData _$$_PostThumbDataFromJson(Map<String, dynamic> json) =>
    _$_PostThumbData(
      postId: json['postId'] as int,
      nickName: json['nickName'] as String,
      topic: json['topic'] as String,
      contents: json['contents'] as String,
      countPostLike: json['countPostLike'] as int,
      countComment: json['countComment'] as int,
      createdAt: json['createdAt'] as String,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$$_PostThumbDataToJson(_$_PostThumbData instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'nickName': instance.nickName,
      'topic': instance.topic,
      'contents': instance.contents,
      'countPostLike': instance.countPostLike,
      'countComment': instance.countComment,
      'createdAt': instance.createdAt,
      'imgUrl': instance.imgUrl,
    };
