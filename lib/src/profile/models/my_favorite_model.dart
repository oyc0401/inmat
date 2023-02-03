import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_favorite_model.g.dart';

part 'my_favorite_model.freezed.dart';

// MyFavoriteModel
// my_favorite_model

// $ flutter pub run build_runner build

@freezed
class MyFavoriteModel with _$MyFavoriteModel {
  factory MyFavoriteModel({
    required String address,
    required double averageStar,
    required int countHeart,
    required int heartId,
    required String? imgUrl,
    required int restaurantId,
    required String restaurantName,
    required String restaurantType,
    required int userId,
  }) = _MyFavoriteModel;

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$MyFavoriteModelFromJson(json);
}
