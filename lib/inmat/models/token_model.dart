import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.g.dart';

part 'token_model.freezed.dart';

// $ flutter pub run build_runner build

@freezed
class Token with _$Token {
  factory Token({
    required String accessToken,
    required String refreshToken,
  }) = _Token;

  factory Token.fromJson(Map<String, dynamic> json) =>
      _$TokenFromJson(json);
}
