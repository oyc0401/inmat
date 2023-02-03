import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_thumb_data.g.dart';
part 'post_thumb_data.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class PostThumbModel with _$PostThumbModel {
  factory PostThumbModel({
    required int postId,
    required String nickName,
    required String topic,
    required String contents,
    required int countPostLike,
    required int countComment,
    required String createdAt,
    required String? imgUrl,
  }) = _PostThumbModel;

  factory PostThumbModel.fromJson(Map<String, dynamic> json) =>
      _$PostThumbModelFromJson(json);
}
