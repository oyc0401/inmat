import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;



// class RefreshApi{
//   static Future<Map> get({
//     required String url,
//     required Map<String, String> headers,
//   }) async {
//     print('headers: $headers');
//
//
//     final Response response = await http.get(Uri.parse(url), headers: headers);
//     _throwHttpException(response);
//
//     return json.decode(utf8.decode(response.bodyBytes));
//   }
//
//   static Future<Map> post({
//     required String url,
//     required Map<String, String> headers,
//     required Map? body,
//   }) async {
//     final Response response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//       body: json.encode(body),
//     );
//
//     // print("헤더: ${response.headers}");
//
//     // print('url: $url');
//     // print('headers: $headers');
//     // print('body: $body');
//     //
//     // print('statusCode: ${response.statusCode}');
//     // print('bodyBytes: ${utf8.decode(response.bodyBytes)}');
//
//     _throwHttpException(response);
//
//     return json.decode(utf8.decode(response.bodyBytes));
//   }
//
//   static Future<Map> patch({
//     required String url,
//     required Map? body,
//     required Map<String, String> headers,
//   }) async {
//     final Response response =
//     await http.patch(Uri.parse(url), headers: headers, body: json.encode(body));
//
//     _throwHttpException(response);
//
//     return json.decode(utf8.decode(response.bodyBytes));
//   }
//
//   static void _throwHttpException(Response response) {
//     switch (response.statusCode) {
//       case 200:
//         return;
//       case 401:
//       // throw ExpirationAccessToken();
//       default:
//         throw Exception(
//             'unexpected status code: ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
//     }
//   }
// }



