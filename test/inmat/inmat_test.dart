import 'package:flutter_test/flutter_test.dart';

void main() {
  group("inmat 테스트", () {
    test("DB에서 토큰 가져오기", () {
      Map<String, String> dummyToken={
        "accessToken":"abcdedsadsa",
        "refreshToken":"opmomnkjnp",
      };

    });


    test("원하는것들",(){
      User? user=InmatAuth.currentUser;

      InmatAuth.login(id, password);

    });

// Registers a function to be run before tests
    setUp(() {});

// Registers a function to be run after tests
    tearDown(() {});

// Registers a function to be run once after all tests
    tearDownAll(() {});
  });
}
