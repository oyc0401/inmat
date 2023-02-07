// import 'dart:convert';
//
// import 'package:http/http.dart';
// import 'package:inmat/inmat/inmat_api/inmat_api.dart';
// import 'package:inmat/inmat/inmat_library.dart';
// import 'package:jwt_decode/jwt_decode.dart';
//
//
// import '../models/token_model.dart';
// import 'http_module.dart';
// import 'inmat_exception.dart';
// import '../auth/inmat_auth.dart';
// import 'inmat_http.dart';
//
//
// // enum Http { get, post, patch }
//
// class InMatRefreshHttp {
//   InMatRefreshHttp(
//     this.how, {
//     required this.url,
//     String? message,
//     this.body,
//   }) : _message = message ?? "이름없는 http 통신";
//
//   Http how;
//   String url;
//   Map? body;
//   final String _message;
//
//   String get _url {
//     return "http://prod.sogogi.shop:9000$url";
//   }
//
//   Future<Token> getValidToken() async {
//     InmatData data = Inmat.user;
//     Token? token = data.token;
//     if (token == null) {
//       throw Exception("unhandled http error: 토큰이 없어요!");
//     }
//
//     DateTime? expiryDate = Jwt.getExpiryDate(token.accessToken);
//
//     print(expiryDate);
//     if (expiryDate == null) {
//       throw Exception("토큰이 이상해요!");
//     }
//
//     DateTime now = DateTime.now();
//
//     Duration difference = expiryDate.difference(now);
//
//     print(difference);
//
//     if (difference.isNegative) {
//       //리프레시 토큰 재발급
//       await InmatAuth.instance.regenerateToken();
//     }
//
//     return Inmat.user.token!;
//   }
//
//   dynamic execute() async {
//     print("InMatHttp: $_message 중...");
//
//     Token model = await getValidToken();
//
//     Map<String, String> header = {
//       "Content-Type": "application/json",
//       'Accept': 'application/json',
//       'Authorization': 'Bearer ${model.accessToken}',
//       "Device-Identifier": '${Inmat.user.deviceIdentifier}',
//       "REFRESH-TOKEN": model.refreshToken,
//       // "User-Agent": deviceIdentifier,
//     };
//
//     Map request = {};
//
//     switch (how) {
//       case Http.get:
//         request = await HttpModule.get(url: _url, headers: header);
//         break;
//       case Http.post:
//         request = await HttpModule.post(
//           url: _url,
//           body: body,
//           headers: header,
//         );
//         break;
//       case Http.patch:
//         request =
//             await HttpModule.patch(url: _url, body: body, headers: header);
//         break;
//     }
//
//     /// 디버그 할 때 [debug]를 true 로 하면 모든 통신의 값을 출력한다.
//     const bool debug = true;
//     if (debug) print('InMatHttp: $request');
//
//     _throwException(request);
//
//     print("InMatHttp: $_message 성공!");
//
//     return request["result"];
//   }
//
//   void _throwException(Map response) {
//     if (response['isSuccess'] == false) {
//       print("InMatHttp: $_message 실패!");
//       int code = response['code'];
//       switch (code) {
//         case 401:
//           throw ExpirationAccessToken();
//         case 403:
//           throw AccessDenied();
//         case 2000:
//           throw Invalidate();
//         case 3010:
//           throw SignInFailed();
//         case 3030:
//           throw OverlappingAccount();
//         case 3035:
//           throw OverlappingNickName();
//         case 4000:
//           throw DataBaseFailed();
//         default:
//           throw Exception(
//               'Failed to $_message: ${response['code']}, ${response['message']}');
//
//         // Failed to 게시글 삭제: 3200, 게시글 삭제에 실패하였습니다.
//       }
//     }
//   }
// }
//
// void _throwHttpException(Response response) {
//   switch (response.statusCode) {
//     case 200:
//       return;
//     case 401:
//     // throw ExpirationAccessToken();
//     default:
//       throw Exception(
//           'unexpected status code: ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
//   }
// }
