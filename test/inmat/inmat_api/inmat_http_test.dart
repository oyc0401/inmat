//
// class InMatHttp {
//
//   // get(){
//   //   group('Counter', () {
//   //     test('value should start at 0', () {
//   //       expect(Counter().value, 0);
//   //     });
//   //
//   //     test('value should be incremented', () {
//   //       final counter = Counter();
//   //
//   //       counter.increment();
//   //
//   //       expect(counter.value, 1);
//   //     });
//   //
//   //     test('value should be decremented', () {
//   //       final counter = Counter();
//   //
//   //       counter.decrement();
//   //
//   //       expect(counter.value, -1);
//   //     });
//   //   });
//   // }
//
//
// }
//
// import 'package:flutter_test/flutter_test.dart';
// import 'package:inmat/inmat/inmat_api/http_module.dart';
//
// void main() {
//
//
//   test("http", () {
//     HttpModule inMatHttp = HttpModule();
//     // inMatHttp.
//
//
//     expect(2, 2);
//   });
// }

//
// void main() async {
//   Uri uri = Uri.parse("http://prod.sogogi.shop:9000/users/signup");
//
//   var bodyJson = json.encode({
//     "username": "dsadas",
//     "email": "dsadas@gmail.com",
//     "password": "dsaadsa321?",
//     "age": 0,
//     "gender": "M",
//     "nickName": "한글",
//     "phoneNumber": "010-2323-2323",
//   });
//   final Response response = await http.post(
//     uri,
//     headers: {
//       "Content-Type": "application/json",
//       'Accept': 'application/json',
//       //HttpHeaders.authorizationHeader: "Basic $token"
//     },
//     body: bodyJson,
//   );
//   print(bodyJson);
//
//   // 요청 성공하면 리턴
//   if (response.statusCode == 200) {
//     print(json.decode(utf8.decode(response.bodyBytes)));
//     return json.decode(utf8.decode(response.bodyBytes));
//   } else {
//     throw Exception(
//         'Failed to load post ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
//   }
// }
