import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_review_model.g.dart';

part 'my_review_model.freezed.dart';

// MyReviewModel
// my_review_model
// my_review_model

// $ flutter pub run build_runner build

@freezed
class MyReviewModel with _$MyReviewModel {
  factory MyReviewModel({
    required String contents,
    required String createdAt,
    required List imgUrlList,
    required int ratingStar,
    required int restaurantId,
    required String restaurantName,
    required int reviewId,
    required int? userId,
  }) = _MyReviewModel;

  factory MyReviewModel.fromJson(Map<String, dynamic> json) =>
      _$MyReviewModelFromJson(json);
}
