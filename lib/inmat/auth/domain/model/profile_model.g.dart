// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      userId: json['userId'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nickName: json['nickName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'nickName': instance.nickName,
      'age': instance.age,
      'gender': instance.gender,
      'profileImgUrl': instance.profileImgUrl,
    };
