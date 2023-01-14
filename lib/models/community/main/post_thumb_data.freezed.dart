// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../models/community/main/post_thumb_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostThumbData _$PostThumbDataFromJson(Map<String, dynamic> json) {
  return _PostThumbData.fromJson(json);
}

/// @nodoc
mixin _$PostThumbData {
  int get postId => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  int get countPostLike => throw _privateConstructorUsedError;
  int get countComment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostThumbDataCopyWith<PostThumbData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostThumbDataCopyWith<$Res> {
  factory $PostThumbDataCopyWith(
          PostThumbData value, $Res Function(PostThumbData) then) =
      _$PostThumbDataCopyWithImpl<$Res, PostThumbData>;
  @useResult
  $Res call(
      {int postId,
      String nickName,
      String topic,
      String contents,
      int countPostLike,
      int countComment,
      String createdAt,
      String? imgUrl});
}

/// @nodoc
class _$PostThumbDataCopyWithImpl<$Res, $Val extends PostThumbData>
    implements $PostThumbDataCopyWith<$Res> {
  _$PostThumbDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? nickName = null,
    Object? topic = null,
    Object? contents = null,
    Object? countPostLike = null,
    Object? countComment = null,
    Object? createdAt = null,
    Object? imgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      countPostLike: null == countPostLike
          ? _value.countPostLike
          : countPostLike // ignore: cast_nullable_to_non_nullable
              as int,
      countComment: null == countComment
          ? _value.countComment
          : countComment // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostThumbDataCopyWith<$Res>
    implements $PostThumbDataCopyWith<$Res> {
  factory _$$_PostThumbDataCopyWith(
          _$_PostThumbData value, $Res Function(_$_PostThumbData) then) =
      __$$_PostThumbDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int postId,
      String nickName,
      String topic,
      String contents,
      int countPostLike,
      int countComment,
      String createdAt,
      String? imgUrl});
}

/// @nodoc
class __$$_PostThumbDataCopyWithImpl<$Res>
    extends _$PostThumbDataCopyWithImpl<$Res, _$_PostThumbData>
    implements _$$_PostThumbDataCopyWith<$Res> {
  __$$_PostThumbDataCopyWithImpl(
      _$_PostThumbData _value, $Res Function(_$_PostThumbData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? nickName = null,
    Object? topic = null,
    Object? contents = null,
    Object? countPostLike = null,
    Object? countComment = null,
    Object? createdAt = null,
    Object? imgUrl = freezed,
  }) {
    return _then(_$_PostThumbData(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      countPostLike: null == countPostLike
          ? _value.countPostLike
          : countPostLike // ignore: cast_nullable_to_non_nullable
              as int,
      countComment: null == countComment
          ? _value.countComment
          : countComment // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostThumbData implements _PostThumbData {
  _$_PostThumbData(
      {required this.postId,
      required this.nickName,
      required this.topic,
      required this.contents,
      required this.countPostLike,
      required this.countComment,
      required this.createdAt,
      required this.imgUrl});

  factory _$_PostThumbData.fromJson(Map<String, dynamic> json) =>
      _$$_PostThumbDataFromJson(json);

  @override
  final int postId;
  @override
  final String nickName;
  @override
  final String topic;
  @override
  final String contents;
  @override
  final int countPostLike;
  @override
  final int countComment;
  @override
  final String createdAt;
  @override
  final String? imgUrl;

  @override
  String toString() {
    return 'PostThumbData(postId: $postId, nickName: $nickName, topic: $topic, contents: $contents, countPostLike: $countPostLike, countComment: $countComment, createdAt: $createdAt, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostThumbData &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.countPostLike, countPostLike) ||
                other.countPostLike == countPostLike) &&
            (identical(other.countComment, countComment) ||
                other.countComment == countComment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postId, nickName, topic,
      contents, countPostLike, countComment, createdAt, imgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostThumbDataCopyWith<_$_PostThumbData> get copyWith =>
      __$$_PostThumbDataCopyWithImpl<_$_PostThumbData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostThumbDataToJson(
      this,
    );
  }
}

abstract class _PostThumbData implements PostThumbData {
  factory _PostThumbData(
      {required final int postId,
      required final String nickName,
      required final String topic,
      required final String contents,
      required final int countPostLike,
      required final int countComment,
      required final String createdAt,
      required final String? imgUrl}) = _$_PostThumbData;

  factory _PostThumbData.fromJson(Map<String, dynamic> json) =
      _$_PostThumbData.fromJson;

  @override
  int get postId;
  @override
  String get nickName;
  @override
  String get topic;
  @override
  String get contents;
  @override
  int get countPostLike;
  @override
  int get countComment;
  @override
  String get createdAt;
  @override
  String? get imgUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PostThumbDataCopyWith<_$_PostThumbData> get copyWith =>
      throw _privateConstructorUsedError;
}
