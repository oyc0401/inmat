// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodayModel _$TodayModelFromJson(Map<String, dynamic> json) {
  return _TodayModel.fromJson(json);
}

/// @nodoc
mixin _$TodayModel {
  int get recommendId => throw _privateConstructorUsedError;
  String? get imgUrl => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodayModelCopyWith<TodayModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayModelCopyWith<$Res> {
  factory $TodayModelCopyWith(
          TodayModel value, $Res Function(TodayModel) then) =
      _$TodayModelCopyWithImpl<$Res, TodayModel>;
  @useResult
  $Res call({int recommendId, String? imgUrl, String foodName});
}

/// @nodoc
class _$TodayModelCopyWithImpl<$Res, $Val extends TodayModel>
    implements $TodayModelCopyWith<$Res> {
  _$TodayModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendId = null,
    Object? imgUrl = freezed,
    Object? foodName = null,
  }) {
    return _then(_value.copyWith(
      recommendId: null == recommendId
          ? _value.recommendId
          : recommendId // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TodayModelCopyWith<$Res>
    implements $TodayModelCopyWith<$Res> {
  factory _$$_TodayModelCopyWith(
          _$_TodayModel value, $Res Function(_$_TodayModel) then) =
      __$$_TodayModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int recommendId, String? imgUrl, String foodName});
}

/// @nodoc
class __$$_TodayModelCopyWithImpl<$Res>
    extends _$TodayModelCopyWithImpl<$Res, _$_TodayModel>
    implements _$$_TodayModelCopyWith<$Res> {
  __$$_TodayModelCopyWithImpl(
      _$_TodayModel _value, $Res Function(_$_TodayModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recommendId = null,
    Object? imgUrl = freezed,
    Object? foodName = null,
  }) {
    return _then(_$_TodayModel(
      recommendId: null == recommendId
          ? _value.recommendId
          : recommendId // ignore: cast_nullable_to_non_nullable
              as int,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodayModel implements _TodayModel {
  _$_TodayModel(
      {required this.recommendId,
      required this.imgUrl,
      required this.foodName});

  factory _$_TodayModel.fromJson(Map<String, dynamic> json) =>
      _$$_TodayModelFromJson(json);

  @override
  final int recommendId;
  @override
  final String? imgUrl;
  @override
  final String foodName;

  @override
  String toString() {
    return 'TodayModel(recommendId: $recommendId, imgUrl: $imgUrl, foodName: $foodName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodayModel &&
            (identical(other.recommendId, recommendId) ||
                other.recommendId == recommendId) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, recommendId, imgUrl, foodName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TodayModelCopyWith<_$_TodayModel> get copyWith =>
      __$$_TodayModelCopyWithImpl<_$_TodayModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodayModelToJson(
      this,
    );
  }
}

abstract class _TodayModel implements TodayModel {
  factory _TodayModel(
      {required final int recommendId,
      required final String? imgUrl,
      required final String foodName}) = _$_TodayModel;

  factory _TodayModel.fromJson(Map<String, dynamic> json) =
      _$_TodayModel.fromJson;

  @override
  int get recommendId;
  @override
  String? get imgUrl;
  @override
  String get foodName;
  @override
  @JsonKey(ignore: true)
  _$$_TodayModelCopyWith<_$_TodayModel> get copyWith =>
      throw _privateConstructorUsedError;
}
