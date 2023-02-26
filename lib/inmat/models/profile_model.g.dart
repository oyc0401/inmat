// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      userId: json['userId'] as int,
      email: json['email'] as String,
      nickName: json['nickName'] as String,
      age: json['age'] as int,
      gender: json['gender'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'nickName': instance.nickName,
      'age': instance.age,
      'gender': instance.gender,
      'profileImgUrl': instance.profileImgUrl,
    };
