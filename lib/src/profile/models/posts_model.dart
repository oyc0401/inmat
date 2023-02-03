import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_model.g.dart';
part 'posts_model.freezed.dart';
// MyPostModel
// posts_model

// $ flutter pub run build_runner build

@freezed
class MyPostModel with _$MyPostModel {
  factory MyPostModel({
    required int postId,
    required String nickName,
    required String topic,
    required String contents,
    required int countPostLike,
    required int countComment,
    required String createdAt,
    required String? imgUrl,
  }) = _MyPostModel;

  factory MyPostModel.fromJson(Map<String, dynamic> json) =>
      _$MyPostModelFromJson(json);
}
