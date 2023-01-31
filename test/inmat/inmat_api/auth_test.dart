import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

void main() {
  group("auth test", () {
    // Registers a function to be run once before all tests
    setUpAll(() async {});

    test("회원가입", () async {
      //2023-02-01 05:17: 테스트 계정 1
      await InMatApi.auth.registerEmail(
          id: "flutter_test1",
          password: "qwe12345&&",
          nickName: "플러터 테스트 계정 1",
          gender: "M",
          age: 21,
          email: "flutter_test1@gmail.com",
          phoneNumber: "010-1234-1234");
    });

    test("로그인", () async {
      Map<String, dynamic> map =
          await InMatApi.auth.login(id: "test123", password: "qwe12345&&");
    });

// Registers a function to be run before tests
    setUp(() {});

// Registers a function to be run after tests
    tearDown(() {});

// Registers a function to be run once after all tests
    tearDownAll(() {});
  });
}
