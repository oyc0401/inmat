import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/auth/Inmat_token.dart';

void main() {
  group("Token", () {
    test('토큰에 값 저장하기', () {
      // given
      final Map<String, dynamic> DBToken = {
        'token': 'SFSA324BD235AB324FS#@TEA',
      };
      final token = Token();
      // when
      token.set(DBToken);

      // then
      expect(token.get(), DBToken);
    });


  });
}

// test('테스트 내용 적는 곳', () {
// // given
//
// // when
//
// // then
//
// });
