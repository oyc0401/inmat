// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
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

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
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
