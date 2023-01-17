import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.g.dart';

part 'profile_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    required int age,
    required String gender,
    required String nickName,
    required String? profileImgUrl,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

