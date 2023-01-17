// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      commentId: json['commentId'] as int,
      nickName: json['nickName'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
      contents: json['contents'] as String,
      countCommentLike: json['countCommentLike'] as int,
      createdAt: json['createdAt'] as String,
      groupNumber: json['groupNumber'] as int,
      parentId: json['parentId'] as int,
      checkUpdated: json['checkUpdated'] as bool,
      myLike: json['myLike'] as bool,
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'nickName': instance.nickName,
      'profileImgUrl': instance.profileImgUrl,
      'contents': instance.contents,
      'countCommentLike': instance.countCommentLike,
      'createdAt': instance.createdAt,
      'groupNumber': instance.groupNumber,
      'parentId': instance.parentId,
      'checkUpdated': instance.checkUpdated,
      'myLike': instance.myLike,
    };
