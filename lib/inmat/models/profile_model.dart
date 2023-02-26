import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.g.dart';

part 'profile_model.freezed.dart';



// part of 'inmat_models.dart';


// $ flutter pub run build_runner build

@freezed
class Profile with _$Profile {
  factory Profile({
    required int userId,
    // required String username,
    required String email,
    // required String phoneNumber,
    required String nickName,
    required int age,
    required String gender,
    required String? profileImgUrl,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
