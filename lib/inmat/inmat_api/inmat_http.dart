import 'dart:developer' as developer;

import 'http_module.dart';
import 'inmat_exception.dart';

enum Http { get, post, patch, delete }

class InMatHttp {
  InMatHttp(
    this.how, {
    required this.path,
    required this.message,
    this.body,
    this.token,
    this.refreshToken,
    this.deviceIdentifier,
  });

  Http how;
  String path;
  String message;
  Map? body;
  String? token;
  String? refreshToken;
  String? deviceIdentifier;

  String get url => "http://prod.sogogi.shop:9000$path";

  dynamic execute() async {
    developer.log("🌐 $message 중...", name: "http");

    Map<String, String> header = {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      "Device-Identifier": '$deviceIdentifier',
      "REFRESH-TOKEN": '$refreshToken',
      // "User-Agent": deviceIdentifier,
    };

    Map request = {};

    switch (how) {
      case Http.get:
        request = await HttpModule.get(url: url, headers: header);
        break;
      case Http.post:
        request = await HttpModule.post(url: url, body: body, headers: header);
        break;
      case Http.patch:
        request = await HttpModule.patch(url: url, body: body, headers: header);
        break;
      case Http.delete:
        request = await HttpModule.delete(url: url, headers: header);
        break;
    }

    /// 디버그 할 때 [debug]를 true 로 하면 모든 통신의 값을 출력한다.
    const bool debug = true;
    if (debug) developer.log("✉️ $request", name: "http");

    _throwException(request);

    developer.log("✅ $message 성공!", name: "http");

    return request["result"];
  }

  void _throwException(Map response) {
    if (response['isSuccess'] == false) {
      developer.log("❌ $message 실패!", name: "http");
      int code = response['code'];
      switch (code) {
        case 401:
          throw ExpirationAccessToken();
        case 403:
          throw AccessDenied();
        case 2000:
          throw Invalidate();
        case 2004:
          throw ExpirationRefreshToken();
        case 3010:
          throw SignInFailed();
        case 3030:
          throw OverlappingAccount();
        case 3035:
          throw OverlappingNickName();
        case 4000:
          throw DataBaseFailed();
        default:
          throw Exception(
              'Failed to $message: ${response['code']}, ${response['message']}');

        // Failed to 게시글 삭제: 3200, 게시글 삭제에 실패하였습니다.
      }
    }
  }
}
