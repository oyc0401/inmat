// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyPostModel _$MyPostModelFromJson(Map<String, dynamic> json) {
  return _MyPostModel.fromJson(json);
}

/// @nodoc
mixin _$MyPostModel {
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
  $MyPostModelCopyWith<MyPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPostModelCopyWith<$Res> {
  factory $MyPostModelCopyWith(
          MyPostModel value, $Res Function(MyPostModel) then) =
      _$MyPostModelCopyWithImpl<$Res, MyPostModel>;
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
class _$MyPostModelCopyWithImpl<$Res, $Val extends MyPostModel>
    implements $MyPostModelCopyWith<$Res> {
  _$MyPostModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_MyPostModelCopyWith<$Res>
    implements $MyPostModelCopyWith<$Res> {
  factory _$$_MyPostModelCopyWith(
          _$_MyPostModel value, $Res Function(_$_MyPostModel) then) =
      __$$_MyPostModelCopyWithImpl<$Res>;
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
class __$$_MyPostModelCopyWithImpl<$Res>
    extends _$MyPostModelCopyWithImpl<$Res, _$_MyPostModel>
    implements _$$_MyPostModelCopyWith<$Res> {
  __$$_MyPostModelCopyWithImpl(
      _$_MyPostModel _value, $Res Function(_$_MyPostModel) _then)
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
    return _then(_$_MyPostModel(
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
class _$_MyPostModel implements _MyPostModel {
  _$_MyPostModel(
      {required this.postId,
      required this.nickName,
      required this.topic,
      required this.contents,
      required this.countPostLike,
      required this.countComment,
      required this.createdAt,
      required this.imgUrl});

  factory _$_MyPostModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyPostModelFromJson(json);

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
    return 'MyPostModel(postId: $postId, nickName: $nickName, topic: $topic, contents: $contents, countPostLike: $countPostLike, countComment: $countComment, createdAt: $createdAt, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPostModel &&
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
  _$$_MyPostModelCopyWith<_$_MyPostModel> get copyWith =>
      __$$_MyPostModelCopyWithImpl<_$_MyPostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyPostModelToJson(
      this,
    );
  }
}

abstract class _MyPostModel implements MyPostModel {
  factory _MyPostModel(
      {required final int postId,
      required final String nickName,
      required final String topic,
      required final String contents,
      required final int countPostLike,
      required final int countComment,
      required final String createdAt,
      required final String? imgUrl}) = _$_MyPostModel;

  factory _MyPostModel.fromJson(Map<String, dynamic> json) =
      _$_MyPostModel.fromJson;

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
  _$$_MyPostModelCopyWith<_$_MyPostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
