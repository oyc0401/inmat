// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      age: json['age'] as int,
      gender: json['gender'] as String,
      nickName: json['nickName'] as String,
      profileImgUrl: json['profileImgUrl'] as String?,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'nickName': instance.nickName,
      'profileImgUrl': instance.profileImgUrl,
    };
