import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.g.dart';

part 'review_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class ReviewModel with _$ReviewModel {
  factory ReviewModel({
    required int restaurantId,
    required int reviewId,
    required String? imgUrl,
    required String restaurantName,
    required String nickName,
    required int ratingStar,
    required String contents,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
