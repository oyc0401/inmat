import 'http_module.dart';
import 'inmat_exception.dart';

enum Http { get, post, patch }

class InMatHttp {
  InMatHttp(
    this.how, {
    required this.url,
    required String? message,
    this.body,
    this.token,
  }) : _message = message ?? "이름없는 http 통신";

  Http how;
  String url;
  Map? body;
  final String _message;
  final String? token;

  dynamic execute() async {
    print("$_message 중...");
    Map response = {};

    HttpModule module = HttpModule();
    switch (how) {
      case Http.get:
        response = await module.get(url: url, token: token);
        break;
      case Http.post:
        response = await module.post(url: url, body: body, token: token);
        break;
      case Http.patch:
        response = await module.patch(url: url, body: body, token: token);
        break;
    }

    _throwException(response);

    ///디버그 할 때 아래 주석을 풀면 모든 통신의 값을 불러온다.
    /// print(response);

    print("$_message 성공!");
    return response["result"];
  }

  _throwException(Map response) {
    if (response['isSuccess'] == false) {
      print("$_message 실패!");
      int code = response['code'];
      switch (code) {
        case 401:
          throw ExpirationAccessToken();
        case 403:
          throw AccessDenied();
        case 2000:
          throw Invalidate();
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
              'Failed to $_message: ${response['code']}, ${response['message']}');
      }
    }
  }
}
