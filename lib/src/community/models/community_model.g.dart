// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommunityModel _$$_CommunityModelFromJson(Map<String, dynamic> json) =>
    _$_CommunityModel(
      postId: json['postId'] as int,
      nickName: json['nickName'] as String,
      topic: json['topic'] as String,
      contents: json['contents'] as String,
      countPostLike: json['countPostLike'] as int,
      countComment: json['countComment'] as int,
      createdAt: json['createdAt'] as String,
      imgUrl: json['imgUrl'] as String?,
    );

Map<String, dynamic> _$$_CommunityModelToJson(_$_CommunityModel instance) =>
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
