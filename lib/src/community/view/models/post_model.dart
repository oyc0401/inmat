import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.g.dart';

part 'post_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class PostModel with _$PostModel {
  factory PostModel({
    required int userId,
    required int postId,
    required String? profileImgUrl,
    required String nickName,
    required String topic,
    required String contents,
    required int countPostLike,
    required int countComment,
    required String createdAt,
    required String? imgUrl,
    required bool myLike,
    required List<Map<String,dynamic>> commentInfoDtoList,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
