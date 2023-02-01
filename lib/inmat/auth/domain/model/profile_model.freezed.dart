// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  int get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get nickName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String? get profileImgUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {int userId,
      String username,
      String email,
      String phoneNumber,
      String nickName,
      int age,
      String gender,
      String? profileImgUrl});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? nickName = null,
    Object? age = null,
    Object? gender = null,
    Object? profileImgUrl = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgUrl: freezed == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$_ProfileModelCopyWith(
          _$_ProfileModel value, $Res Function(_$_ProfileModel) then) =
      __$$_ProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int userId,
      String username,
      String email,
      String phoneNumber,
      String nickName,
      int age,
      String gender,
      String? profileImgUrl});
}

/// @nodoc
class __$$_ProfileModelCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$_ProfileModel>
    implements _$$_ProfileModelCopyWith<$Res> {
  __$$_ProfileModelCopyWithImpl(
      _$_ProfileModel _value, $Res Function(_$_ProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? nickName = null,
    Object? age = null,
    Object? gender = null,
    Object? profileImgUrl = freezed,
  }) {
    return _then(_$_ProfileModel(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      nickName: null == nickName
          ? _value.nickName
          : nickName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profileImgUrl: freezed == profileImgUrl
          ? _value.profileImgUrl
          : profileImgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileModel implements _ProfileModel {
  _$_ProfileModel(
      {required this.userId,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.nickName,
      required this.age,
      required this.gender,
      required this.profileImgUrl});

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  @override
  final int userId;
  @override
  final String username;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String nickName;
  @override
  final int age;
  @override
  final String gender;
  @override
  final String? profileImgUrl;

  @override
  String toString() {
    return 'ProfileModel(userId: $userId, username: $username, email: $email, phoneNumber: $phoneNumber, nickName: $nickName, age: $age, gender: $gender, profileImgUrl: $profileImgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.nickName, nickName) ||
                other.nickName == nickName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileImgUrl, profileImgUrl) ||
                other.profileImgUrl == profileImgUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, username, email,
      phoneNumber, nickName, age, gender, profileImgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      __$$_ProfileModelCopyWithImpl<_$_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  factory _ProfileModel(
      {required final int userId,
      required final String username,
      required final String email,
      required final String phoneNumber,
      required final String nickName,
      required final int age,
      required final String gender,
      required final String? profileImgUrl}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  int get userId;
  @override
  String get username;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get nickName;
  @override
  int get age;
  @override
  String get gender;
  @override
  String? get profileImgUrl;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}
