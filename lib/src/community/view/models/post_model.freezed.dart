// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  int get userId => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;
  String? get profileImgUrl => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;
  int get countPostLike => throw _privateConstructorUsedError;
  int get countComment => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  bool get myLike => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get commentInfoDtoList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {int userId,
      int postId,
      String? profileImgUrl,
      String nickName,
      String topic,
      String contents,
      int countPostLike,
      int countComment,
      String createdAt,
      String? imgUrl,
      bool myLike,
      List<Map<String, dynamic>> commentInfoDtoList});
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? postId = null,
    Object? profileImgUrl = freezed,
    Object? nickName = null,
    Object? topic = null,
    Object? contents = null,
    Object? countPostLike = null,
    Object? countComment = null,
    Object? createdAt = null,
    Object? imgUrl = freezed,
    Object? myLike = null,
    Object? commentInfoDtoList = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      profileImgUrl: freezed == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      myLike: null == myLike
          ? _value.myLike
          : myLike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentInfoDtoList: null == commentInfoDtoList
          ? _value.commentInfoDtoList
          : commentInfoDtoList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$$_PostModelCopyWith(
          _$_PostModel value, $Res Function(_$_PostModel) then) =
      __$$_PostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      int postId,
      String? profileImgUrl,
      String nickName,
      String topic,
      String contents,
      int countPostLike,
      int countComment,
      String createdAt,
      String? imgUrl,
      bool myLike,
      List<Map<String, dynamic>> commentInfoDtoList});
}

/// @nodoc
class __$$_PostModelCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$_PostModel>
    implements _$$_PostModelCopyWith<$Res> {
  __$$_PostModelCopyWithImpl(
      _$_PostModel _value, $Res Function(_$_PostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? postId = null,
    Object? profileImgUrl = freezed,
    Object? nickName = null,
    Object? topic = null,
    Object? contents = null,
    Object? countPostLike = null,
    Object? countComment = null,
    Object? createdAt = null,
    Object? imgUrl = freezed,
    Object? myLike = null,
    Object? commentInfoDtoList = null,
  }) {
    return _then(_$_PostModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      profileImgUrl: freezed == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
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
      myLike: null == myLike
          ? _value.myLike
          : myLike // ignore: cast_nullable_to_non_nullable
              as bool,
      commentInfoDtoList: null == commentInfoDtoList
          ? _value._commentInfoDtoList
          : commentInfoDtoList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel implements _PostModel {
  _$_PostModel(
      {required this.userId,
      required this.postId,
      required this.profileImgUrl,
      required this.nickName,
      required this.topic,
      required this.contents,
      required this.countPostLike,
      required this.countComment,
      required this.createdAt,
      required this.imgUrl,
      required this.myLike,
      required final List<Map<String, dynamic>> commentInfoDtoList})
      : _commentInfoDtoList = commentInfoDtoList;

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @override
  final int userId;
  @override
  final int postId;
  @override
  final String? profileImgUrl;
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
  final bool myLike;
  final List<Map<String, dynamic>> _commentInfoDtoList;
  @override
  List<Map<String, dynamic>> get commentInfoDtoList {
    if (_commentInfoDtoList is EqualUnmodifiableListView)
      return _commentInfoDtoList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commentInfoDtoList);
  }

  @override
  String toString() {
    return 'PostModel(userId: $userId, postId: $postId, profileImgUrl: $profileImgUrl, nickName: $nickName, topic: $topic, contents: $contents, countPostLike: $countPostLike, countComment: $countComment, createdAt: $createdAt, imgUrl: $imgUrl, myLike: $myLike, commentInfoDtoList: $commentInfoDtoList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.profileImgUrl, profileImgUrl) ||
                other.profileImgUrl == profileImgUrl) &&
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
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.myLike, myLike) || other.myLike == myLike) &&
            const DeepCollectionEquality()
                .equals(other._commentInfoDtoList, _commentInfoDtoList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      postId,
      profileImgUrl,
      nickName,
      topic,
      contents,
      countPostLike,
      countComment,
      createdAt,
      imgUrl,
      myLike,
      const DeepCollectionEquality().hash(_commentInfoDtoList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      __$$_PostModelCopyWithImpl<_$_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(
      this,
    );
  }
}

abstract class _PostModel implements PostModel {
  factory _PostModel(
          {required final int userId,
          required final int postId,
          required final String? profileImgUrl,
          required final String nickName,
          required final String topic,
          required final String contents,
          required final int countPostLike,
          required final int countComment,
          required final String createdAt,
          required final String? imgUrl,
          required final bool myLike,
          required final List<Map<String, dynamic>> commentInfoDtoList}) =
      _$_PostModel;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  int get userId;
  @override
  int get postId;
  @override
  String? get profileImgUrl;
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
  bool get myLike;
  @override
  List<Map<String, dynamic>> get commentInfoDtoList;
  @override
  @JsonKey(ignore: true)
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}
