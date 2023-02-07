import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/models/token_model.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:jwt_decode/jwt_decode.dart';

void main() {
  group("inmap api class 테스트", () {

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

    test("토큰 유효기간 체크", () async {
      // String deviceIdentifier = await MobileId.getMobileId();

      String token=testToken.accessToken;

      Map<String, dynamic> payload = Jwt.parseJwt(token);

      print(payload);

      DateTime? expiryDate = Jwt.getExpiryDate(token);

      print(expiryDate);

      DateTime now=DateTime.now();
      if(expiryDate!=null){

        Duration difference = expiryDate.difference(now);

        print(difference);

        if(difference.isNegative){

        }
      }



    });



// Registers a function to be run before tests
    setUp(() {});

// Registers a function to be run after tests
    tearDown(() {});

// Registers a function to be run once after all tests
    tearDownAll(() {});
  });
}
