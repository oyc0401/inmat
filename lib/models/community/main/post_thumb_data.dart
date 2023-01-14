import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_thumb_data.g.dart';
part 'post_thumb_data.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class PostThumbData with _$PostThumbData {
  factory PostThumbData({
    required int postId,
    required String nickName,
    required String topic,
    required String contents,
    required int countPostLike,
    required int countComment,
    required String createdAt,
    required String? imgUrl,
  }) = _PostThumbData;

  factory PostThumbData.fromJson(Map<String, dynamic> json) =>
      _$PostThumbDataFromJson(json);
}
