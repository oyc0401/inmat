import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/auth/domain/model/profile_model.dart';
import 'package:inmat/inmat/auth/domain/model/token_model.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

void main() {
  group("account api 테스트", () {
    late Token testToken;

    const String testId = "flutter1";
    const String testPassword = "qwe12345&&";
    const String testDeviceIdentifier = "dart_pad";

    setUpAll(() async {
      // 로그인
      Map<String, dynamic> json = await InMatApi.auth.login(
        id: testId,
        password: testPassword,
        deviceIdentifier: testDeviceIdentifier,
      );

      testToken = Token.fromJson(json);
    });

    test("서명된 url 얻기", () async {
      String url =
          await InMatApi.utils.getImageUrl("image.jpg", testToken.accessToken);
      print(url);
    });
  });
}
