// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model_json.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HomeModelJson _$HomeModelJsonFromJson(Map<String, dynamic> json) {
  return _HomeModelJson.fromJson(json);
}

/// @nodoc
mixin _$HomeModelJson {
  List<Map<String, dynamic>> get bannerList =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get recentReviewList =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get restaurantList =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get todayRecommendList =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeModelJsonCopyWith<HomeModelJson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeModelJsonCopyWith<$Res> {
  factory $HomeModelJsonCopyWith(
          HomeModelJson value, $Res Function(HomeModelJson) then) =
      _$HomeModelJsonCopyWithImpl<$Res, HomeModelJson>;
  @useResult
  $Res call(
      {List<Map<String, dynamic>> bannerList,
      List<Map<String, dynamic>> recentReviewList,
      List<Map<String, dynamic>> restaurantList,
      List<Map<String, dynamic>> todayRecommendList});
}

/// @nodoc
class _$HomeModelJsonCopyWithImpl<$Res, $Val extends HomeModelJson>
    implements $HomeModelJsonCopyWith<$Res> {
  _$HomeModelJsonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerList = null,
    Object? recentReviewList = null,
    Object? restaurantList = null,
    Object? todayRecommendList = null,
  }) {
    return _then(_value.copyWith(
      bannerList: null == bannerList
          ? _value.bannerList
          : bannerList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      recentReviewList: null == recentReviewList
          ? _value.recentReviewList
          : recentReviewList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      restaurantList: null == restaurantList
          ? _value.restaurantList
          : restaurantList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      todayRecommendList: null == todayRecommendList
          ? _value.todayRecommendList
          : todayRecommendList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeModelJsonCopyWith<$Res>
    implements $HomeModelJsonCopyWith<$Res> {
  factory _$$_HomeModelJsonCopyWith(
          _$_HomeModelJson value, $Res Function(_$_HomeModelJson) then) =
      __$$_HomeModelJsonCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, dynamic>> bannerList,
      List<Map<String, dynamic>> recentReviewList,
      List<Map<String, dynamic>> restaurantList,
      List<Map<String, dynamic>> todayRecommendList});
}

/// @nodoc
class __$$_HomeModelJsonCopyWithImpl<$Res>
    extends _$HomeModelJsonCopyWithImpl<$Res, _$_HomeModelJson>
    implements _$$_HomeModelJsonCopyWith<$Res> {
  __$$_HomeModelJsonCopyWithImpl(
      _$_HomeModelJson _value, $Res Function(_$_HomeModelJson) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerList = null,
    Object? recentReviewList = null,
    Object? restaurantList = null,
    Object? todayRecommendList = null,
  }) {
    return _then(_$_HomeModelJson(
      bannerList: null == bannerList
          ? _value._bannerList
          : bannerList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      recentReviewList: null == recentReviewList
          ? _value._recentReviewList
          : recentReviewList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      restaurantList: null == restaurantList
          ? _value._restaurantList
          : restaurantList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      todayRecommendList: null == todayRecommendList
          ? _value._todayRecommendList
          : todayRecommendList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HomeModelJson implements _HomeModelJson {
  _$_HomeModelJson(
      {required final List<Map<String, dynamic>> bannerList,
      required final List<Map<String, dynamic>> recentReviewList,
      required final List<Map<String, dynamic>> restaurantList,
      required final List<Map<String, dynamic>> todayRecommendList})
      : _bannerList = bannerList,
        _recentReviewList = recentReviewList,
        _restaurantList = restaurantList,
        _todayRecommendList = todayRecommendList;

  factory _$_HomeModelJson.fromJson(Map<String, dynamic> json) =>
      _$$_HomeModelJsonFromJson(json);

  final List<Map<String, dynamic>> _bannerList;
  @override
  List<Map<String, dynamic>> get bannerList {
    if (_bannerList is EqualUnmodifiableListView) return _bannerList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bannerList);
  }

  final List<Map<String, dynamic>> _recentReviewList;
  @override
  List<Map<String, dynamic>> get recentReviewList {
    if (_recentReviewList is EqualUnmodifiableListView)
      return _recentReviewList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentReviewList);
  }

  final List<Map<String, dynamic>> _restaurantList;
  @override
  List<Map<String, dynamic>> get restaurantList {
    if (_restaurantList is EqualUnmodifiableListView) return _restaurantList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurantList);
  }

  final List<Map<String, dynamic>> _todayRecommendList;
  @override
  List<Map<String, dynamic>> get todayRecommendList {
    if (_todayRecommendList is EqualUnmodifiableListView)
      return _todayRecommendList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todayRecommendList);
  }

  @override
  String toString() {
    return 'HomeModelJson(bannerList: $bannerList, recentReviewList: $recentReviewList, restaurantList: $restaurantList, todayRecommendList: $todayRecommendList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeModelJson &&
            const DeepCollectionEquality()
                .equals(other._bannerList, _bannerList) &&
            const DeepCollectionEquality()
                .equals(other._recentReviewList, _recentReviewList) &&
            const DeepCollectionEquality()
                .equals(other._restaurantList, _restaurantList) &&
            const DeepCollectionEquality()
                .equals(other._todayRecommendList, _todayRecommendList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bannerList),
      const DeepCollectionEquality().hash(_recentReviewList),
      const DeepCollectionEquality().hash(_restaurantList),
      const DeepCollectionEquality().hash(_todayRecommendList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeModelJsonCopyWith<_$_HomeModelJson> get copyWith =>
      __$$_HomeModelJsonCopyWithImpl<_$_HomeModelJson>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HomeModelJsonToJson(
      this,
    );
  }
}

abstract class _HomeModelJson implements HomeModelJson {
  factory _HomeModelJson(
          {required final List<Map<String, dynamic>> bannerList,
          required final List<Map<String, dynamic>> recentReviewList,
          required final List<Map<String, dynamic>> restaurantList,
          required final List<Map<String, dynamic>> todayRecommendList}) =
      _$_HomeModelJson;

  factory _HomeModelJson.fromJson(Map<String, dynamic> json) =
      _$_HomeModelJson.fromJson;

  @override
  List<Map<String, dynamic>> get bannerList;
  @override
  List<Map<String, dynamic>> get recentReviewList;
  @override
  List<Map<String, dynamic>> get restaurantList;
  @override
  List<Map<String, dynamic>> get todayRecommendList;
  @override
  @JsonKey(ignore: true)
  _$$_HomeModelJsonCopyWith<_$_HomeModelJson> get copyWith =>
      throw _privateConstructorUsedError;
}
