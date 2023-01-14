import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.g.dart';
part 'banner_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class BannerModel with _$BannerModel {
  factory BannerModel({
    required  String? pageUrl,
  }) = _BannerModel;

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);
}

