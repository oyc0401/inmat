// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentModel _$$_ContentModelFromJson(Map<String, dynamic> json) =>
    _$_ContentModel(
      userId: json['userId'] as int,
      postId: json['postId'] as int,
      profileImgUrl: json['profileImgUrl'] as String?,
      nickName: json['nickName'] as String,
      topic: json['topic'] as String,
      contents: json['contents'] as String,
      countPostLike: json['countPostLike'] as int,
      countComment: json['countComment'] as int,
      createdAt: json['createdAt'] as String,
      imgUrl: json['imgUrl'] as String?,
      myLike: json['myLike'] as bool,
      commentInfoDtoList: (json['commentInfoDtoList'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$_ContentModelToJson(_$_ContentModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'postId': instance.postId,
      'profileImgUrl': instance.profileImgUrl,
      'nickName': instance.nickName,
      'topic': instance.topic,
      'contents': instance.contents,
      'countPostLike': instance.countPostLike,
      'countComment': instance.countComment,
      'createdAt': instance.createdAt,
      'imgUrl': instance.imgUrl,
      'myLike': instance.myLike,
      'commentInfoDtoList': instance.commentInfoDtoList,
    };
