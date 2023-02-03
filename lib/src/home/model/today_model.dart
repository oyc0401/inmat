import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_model.g.dart';
part 'today_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class TodayModel with _$TodayModel {
  factory TodayModel({
    required int recommendId,
    required String? imgUrl,
    required String foodName,
  }) = _TodayModel;

  factory TodayModel.fromJson(Map<String, dynamic> json) =>
      _$TodayModelFromJson(json);
}


