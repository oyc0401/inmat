// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) {
  return _TokenModel.fromJson(json);
}

/// @nodoc
mixin _$TokenModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenModelCopyWith<TokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenModelCopyWith<$Res> {
  factory $TokenModelCopyWith(
          TokenModel value, $Res Function(TokenModel) then) =
      _$TokenModelCopyWithImpl<$Res, TokenModel>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$TokenModelCopyWithImpl<$Res, $Val extends TokenModel>
    implements $TokenModelCopyWith<$Res> {
  _$TokenModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenModelCopyWith<$Res>
    implements $TokenModelCopyWith<$Res> {
  factory _$$_TokenModelCopyWith(
          _$_TokenModel value, $Res Function(_$_TokenModel) then) =
      __$$_TokenModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$_TokenModelCopyWithImpl<$Res>
    extends _$TokenModelCopyWithImpl<$Res, _$_TokenModel>
    implements _$$_TokenModelCopyWith<$Res> {
  __$$_TokenModelCopyWithImpl(
      _$_TokenModel _value, $Res Function(_$_TokenModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_TokenModel(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenModel implements _TokenModel {
  _$_TokenModel({required this.accessToken, required this.refreshToken});

  factory _$_TokenModel.fromJson(Map<String, dynamic> json) =>
      _$$_TokenModelFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'TokenModel(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenModel &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenModelCopyWith<_$_TokenModel> get copyWith =>
      __$$_TokenModelCopyWithImpl<_$_TokenModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenModelToJson(
      this,
    );
  }
}

abstract class _TokenModel implements TokenModel {
  factory _TokenModel(
      {required final String accessToken,
      required final String refreshToken}) = _$_TokenModel;

  factory _TokenModel.fromJson(Map<String, dynamic> json) =
      _$_TokenModel.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_TokenModelCopyWith<_$_TokenModel> get copyWith =>
      throw _privateConstructorUsedError;
}
