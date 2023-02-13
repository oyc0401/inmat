import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.g.dart';

part 'comment_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class CommentModel with _$CommentModel {
  factory CommentModel({
    required int commentId,
    required String nickName,
    required String? profileImgUrl,
    required String contents,
    required int countCommentLike,
    required String createdAt,
    required int groupNumber,
    required int parentId,
    required bool checkUpdated,
    required bool myLike,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}

//{commentId: 1, nickName: 빨간색, profileImgUrl: null, contents: 재밌어요,
// countCommentLike: 1, createdAt: 1월 전, groupNumber: 1, parentId: 0, checkUpdated: true, myLike: false}
