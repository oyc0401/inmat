// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  int get restaurantId => throw _privateConstructorUsedError;
  int get reviewId => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  int get ratingStar => throw _privateConstructorUsedError;
  String get contents => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {int restaurantId,
      int reviewId,
      String? imgUrl,
      String restaurantName,
      String nickName,
      int ratingStar,
      String contents});
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? reviewId = null,
    Object? imgUrl = freezed,
    Object? restaurantName = null,
    Object? nickName = null,
    Object? ratingStar = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      ratingStar: null == ratingStar
          ? _value.ratingStar
          : ratingStar // ignore: cast_nullable_to_non_nullable
              as int,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$_ReviewModelCopyWith(
          _$_ReviewModel value, $Res Function(_$_ReviewModel) then) =
      __$$_ReviewModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int restaurantId,
      int reviewId,
      String? imgUrl,
      String restaurantName,
      String nickName,
      int ratingStar,
      String contents});
}

/// @nodoc
class __$$_ReviewModelCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$_ReviewModel>
    implements _$$_ReviewModelCopyWith<$Res> {
  __$$_ReviewModelCopyWithImpl(
      _$_ReviewModel _value, $Res Function(_$_ReviewModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? reviewId = null,
    Object? imgUrl = freezed,
    Object? restaurantName = null,
    Object? nickName = null,
    Object? ratingStar = null,
    Object? contents = null,
  }) {
    return _then(_$_ReviewModel(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as int,
      reviewId: null == reviewId
          ? _value.reviewId
          : reviewId // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      ratingStar: null == ratingStar
          ? _value.ratingStar
          : ratingStar // ignore: cast_nullable_to_non_nullable
              as int,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReviewModel implements _ReviewModel {
  _$_ReviewModel(
      {required this.restaurantId,
      required this.reviewId,
      required this.imgUrl,
      required this.restaurantName,
      required this.nickName,
      required this.ratingStar,
      required this.contents});

  factory _$_ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReviewModelFromJson(json);

  @override
  final int restaurantId;
  @override
  final int reviewId;
  @override
  final String? imgUrl;
  @override
  final String restaurantName;
  @override
  final String nickName;
  @override
  final int ratingStar;
  @override
  final String contents;

  @override
  String toString() {
    return 'ReviewModel(restaurantId: $restaurantId, reviewId: $reviewId, imgUrl: $imgUrl, restaurantName: $restaurantName, nickName: $nickName, ratingStar: $ratingStar, contents: $contents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReviewModel &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.reviewId, reviewId) ||
                other.reviewId == reviewId) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.ratingStar, ratingStar) ||
                other.ratingStar == ratingStar) &&
            (identical(other.contents, contents) ||
                other.contents == contents));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, restaurantId, reviewId, imgUrl,
      restaurantName, nickName, ratingStar, contents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      __$$_ReviewModelCopyWithImpl<_$_ReviewModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReviewModelToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  factory _ReviewModel(
      {required final int restaurantId,
      required final int reviewId,
      required final String? imgUrl,
      required final String restaurantName,
      required final String nickName,
      required final int ratingStar,
      required final String contents}) = _$_ReviewModel;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$_ReviewModel.fromJson;

  @override
  int get restaurantId;
  @override
  int get reviewId;
  @override
  String? get imgUrl;
  @override
  String get restaurantName;
  @override
  String get nickName;
  @override
  int get ratingStar;
  @override
  String get contents;
  @override
  @JsonKey(ignore: true)
  _$$_ReviewModelCopyWith<_$_ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}
