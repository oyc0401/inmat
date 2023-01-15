import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_model.g.dart';
part 'restaurant_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class RestaurantModel with _$RestaurantModel {
  factory RestaurantModel({
    required int restaurantId,
    required String profileImgUrl,
    required String restaurantName,
    required String address,
    required double averageStar,
    required int countReview,
    required int averagePrice,
    required int complexity,
    required String restaurantType,
    required bool userHeart,
  }) = _RestaurantModel;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}

