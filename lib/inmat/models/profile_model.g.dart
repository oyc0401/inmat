// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      userId: json['userId'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      nickName: json['nickName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
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
