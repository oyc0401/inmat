// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyReviewModel _$MyReviewModelFromJson(Map<String, dynamic> json) {
  return _MyReviewModel.fromJson(json);
}

/// @nodoc
mixin _$MyReviewModel {
  String get contents => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<dynamic> get imgUrlList => throw _privateConstructorUsedError;
  int get ratingStar => throw _privateConstructorUsedError;
  int get restaurantId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  int get reviewId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyReviewModelCopyWith<MyReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyReviewModelCopyWith<$Res> {
  factory $MyReviewModelCopyWith(
          MyReviewModel value, $Res Function(MyReviewModel) then) =
      _$MyReviewModelCopyWithImpl<$Res, MyReviewModel>;
  @useResult
  $Res call(
      {String contents,
      String createdAt,
      List<dynamic> imgUrlList,
      int ratingStar,
      int restaurantId,
      String restaurantName,
      int reviewId,
      int? userId});
}

/// @nodoc
class _$MyReviewModelCopyWithImpl<$Res, $Val extends MyReviewModel>
    implements $MyReviewModelCopyWith<$Res> {
  _$MyReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? createdAt = null,
    Object? imgUrlList = null,
    Object? ratingStar = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? reviewId = null,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrlList: null == imgUrlList
          ? _value.imgUrlList
          : imgUrlList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      ratingStar: null == ratingStar
          ? _value.ratingStar
          : ratingStar // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyReviewModelCopyWith<$Res>
    implements $MyReviewModelCopyWith<$Res> {
  factory _$$_MyReviewModelCopyWith(
          _$_MyReviewModel value, $Res Function(_$_MyReviewModel) then) =
      __$$_MyReviewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contents,
      String createdAt,
      List<dynamic> imgUrlList,
      int ratingStar,
      int restaurantId,
      String restaurantName,
      int reviewId,
      int? userId});
}

/// @nodoc
class __$$_MyReviewModelCopyWithImpl<$Res>
    extends _$MyReviewModelCopyWithImpl<$Res, _$_MyReviewModel>
    implements _$$_MyReviewModelCopyWith<$Res> {
  __$$_MyReviewModelCopyWithImpl(
      _$_MyReviewModel _value, $Res Function(_$_MyReviewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contents = null,
    Object? createdAt = null,
    Object? imgUrlList = null,
    Object? ratingStar = null,
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? reviewId = null,
    Object? userId = freezed,
  }) {
    return _then(_$_MyReviewModel(
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      imgUrlList: null == imgUrlList
          ? _value._imgUrlList
          : imgUrlList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      ratingStar: null == ratingStar
          ? _value.ratingStar
          : ratingStar // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyReviewModel implements _MyReviewModel {
  _$_MyReviewModel(
      {required this.contents,
      required this.createdAt,
      required final List<dynamic> imgUrlList,
      required this.ratingStar,
      required this.restaurantId,
      required this.restaurantName,
      required this.reviewId,
      required this.userId})
      : _imgUrlList = imgUrlList;

  factory _$_MyReviewModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyReviewModelFromJson(json);

  @override
  final String contents;
  @override
  final String createdAt;
  final List<dynamic> _imgUrlList;
  @override
  List<dynamic> get imgUrlList {
    if (_imgUrlList is EqualUnmodifiableListView) return _imgUrlList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imgUrlList);
  }

  @override
  final int ratingStar;
  @override
  final int restaurantId;
  @override
  final String restaurantName;
  @override
  final int reviewId;
  @override
  final int? userId;

  @override
  String toString() {
    return 'MyReviewModel(contents: $contents, createdAt: $createdAt, imgUrlList: $imgUrlList, ratingStar: $ratingStar, restaurantId: $restaurantId, restaurantName: $restaurantName, reviewId: $reviewId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyReviewModel &&
            (identical(other.contents, contents) ||
                other.contents == contents) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._imgUrlList, _imgUrlList) &&
            (identical(other.ratingStar, ratingStar) ||
                other.ratingStar == ratingStar) &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      contents,
      createdAt,
      const DeepCollectionEquality().hash(_imgUrlList),
      ratingStar,
      restaurantId,
      restaurantName,
      reviewId,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyReviewModelCopyWith<_$_MyReviewModel> get copyWith =>
      __$$_MyReviewModelCopyWithImpl<_$_MyReviewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyReviewModelToJson(
      this,
    );
  }
}

abstract class _MyReviewModel implements MyReviewModel {
  factory _MyReviewModel(
      {required final String contents,
      required final String createdAt,
      required final List<dynamic> imgUrlList,
      required final int ratingStar,
      required final int restaurantId,
      required final String restaurantName,
      required final int reviewId,
      required final int? userId}) = _$_MyReviewModel;

  factory _MyReviewModel.fromJson(Map<String, dynamic> json) =
      _$_MyReviewModel.fromJson;

  @override
  String get contents;
  @override
  String get createdAt;
  @override
  List<dynamic> get imgUrlList;
  @override
  int get ratingStar;
  @override
  int get restaurantId;
  @override
  String get restaurantName;
  @override
  int get reviewId;
  @override
  int? get userId;
  @override
  @JsonKey(ignore: true)
  _$$_MyReviewModelCopyWith<_$_MyReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
