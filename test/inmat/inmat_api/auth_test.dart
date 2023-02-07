import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/models/token_model.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

void main() {
  group("auth api 테스트", () {
    const String testId = "flutter1";
    const String testPassword = "qwe12345&&";
    const String testDeviceIdentifier = "dart_pad";

    test("로그인", () async {
      Map<String, dynamic> json = await InmatApi.auth.login(
        id: testId,
        password: testPassword,
        deviceIdentifier: testDeviceIdentifier,
      );

      Token tokenModel = Token.fromJson(json);
    });

    test("익명 로그인", () async {
      Map<String, dynamic> json =
          await InmatApi.auth.loginAnonymous(testDeviceIdentifier);

      Token tokenModel = Token.fromJson(json);
    });

    test(
      "토큰 재발급",
      () async {
        Map<String, dynamic> map = await InmatApi.auth.login(
          id: testId,
          password: testPassword,
          deviceIdentifier: testDeviceIdentifier,
        );

        Token token = Token.fromJson(map);
        print(token);

        await Future.delayed(Duration(seconds: 61));

        Map<String, dynamic> json = await InmatApi.auth.issue(
          accessToken: token.accessToken,
          refreshToken: token.refreshToken,
          deviceIdentifier: testDeviceIdentifier,
        );

        Token tokenModel = Token.fromJson(json);

        print(tokenModel);
      },
      skip: "액세스 토큰 만료시간까지 기다려야하기 때문에 토큰 재발급은 테스트하지 않습니다.",
      // skip: "동시에 모든 테스트가 실행되고 여기서 로그인-> 위에서 로그인-> 여기서 재발급 하면 오류가 생기기때문에 토큰 재발급은 테스트하지 않습니다.",
    );

    test("닉네임 중복체크", () async {
      String message = await InmatApi.auth.checkNickName("한글임");
      expect(message, "닉네임 사용가능!");
    });

    test("아이디 중복체크", () async {
      String message = await InmatApi.auth.checkId("m9zil2d");
      expect(message, "아이디 사용가능!");
    });

    /// 2023-02-01 21:26
    /// id: flutter1, password: qwe12345&&
    test(
      "회원가입",
      () async {
        await InmatApi.auth.registerEmail(
          id: "flutter1",
          password: "qwe12345&&",
          nickName: "플러터하나",
          gender: "M",
          age: 21,
          email: "flutter1@gmail.com",
          phoneNumber: "010-1234-1235",
        );
      },
      skip: "새로 계정을 만들어야 해서 회원가입은 테스트하지 않습니다.",
    );

// Registers a function to be run before tests
    setUp(() {});

// Registers a function to be run after tests
    tearDown(() {});

// Registers a function to be run once after all tests
    tearDownAll(() {});
  });
}
