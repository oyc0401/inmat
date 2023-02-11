import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/inmat.dart';
import 'package:inmat/inmat/models/token_model.dart';
import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';

void main() {
  group("account api 테스트", () {
    late Token testToken;

    const String testId = "test123";
    const String testPassword = "qwe12345&&";
    const String testDeviceIdentifier = "dart_pad";

    setUpAll(() async {
      // 로그인
      Map<String, dynamic> json = await InmatApi.auth.login(
        id: testId,
        password: testPassword,
        deviceIdentifier: testDeviceIdentifier,
      );

      testToken = Token.fromJson(json);
      Inmat.initialTest(testToken);
    });

    test("서명된 url 얻기", () async {
      String url = await InmatApi.utils.getImageUrl("image.jpg");
      print(url);
    });
  });
}
