import 'package:freezed_annotation/freezed_annotation.dart';

part 'content_model.g.dart';

part 'content_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class ContentModel with _$ContentModel {
  factory ContentModel({
    required int? userId, /// TODO
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
    required List<List> commentInfoDtoList,
  }) = _ContentModel;

  factory ContentModel.fromJson(Map<String, dynamic> json) =>
      _$ContentModelFromJson(json);
}
