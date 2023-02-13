import 'package:freezed_annotation/freezed_annotation.dart';

part 'community_model.g.dart';
part 'community_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class CommunityModel with _$CommunityModel {
  factory CommunityModel({
    required int postId,
    required String nickName,
    required String topic,
    required String contents,
    required int countPostLike,
    required int countComment,
    required String createdAt,
    required String? imgUrl,
  }) = _CommunityModel;

  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);
}
