import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/auth/domain/model/profile_model.dart';
import 'package:inmat/inmat/auth/domain/model/token_model.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

void main() {
  group("account api 테스트", () {
    late TokenModel testToken;

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

      testToken = TokenModel.fromJson(json);
    });

    test("로그인", () async {
      Map<String, dynamic> loginData = await InMatApi.auth.login(
        id: testId,
        password: testPassword,
        deviceIdentifier: testDeviceIdentifier,
      );

      testToken = TokenModel.fromJson(loginData);
    });

    test("프로필 불러오기", () async {
      Map<String, dynamic> json =
          await InMatApi.account.getProfile(testToken.accessToken);

      ProfileModel model = ProfileModel.fromJson(json);
    });

    test("프로필 수정하기", () async {
      int age = 22;
      String gender = "M";
      String nickName = "플러터하나나";
      String? profileImgUrl = null;

      // 프로필 업데이트
      await InMatApi.account.updateProfile(
        age: age,
        gender: gender,
        nickName: nickName,
        profileImgUrl: profileImgUrl,
        token: testToken.accessToken,
      );
    });

    test("프로필 수정하기 비교", () async {
      int age = 22;
      String gender = "M";
      String nickName = "플러터하나나";
      String? profileImgUrl = null;

      //기존 프로필 가져오기
      Map<String, dynamic> data =
          await InMatApi.account.getProfile(testToken.accessToken);
      ProfileModel model = ProfileModel.fromJson(data);

      ProfileModel previous = ProfileModel(
        userId: model.userId,
        username: model.username,
        email: model.email,
        phoneNumber: model.phoneNumber,
        nickName: model.nickName,
        age: age,
        gender: gender,
        profileImgUrl: profileImgUrl,
      );

      // 프로필 업데이트
      await InMatApi.account.updateProfile(
        age: age,
        gender: gender,
        nickName: nickName,
        profileImgUrl: profileImgUrl,
        token: testToken.accessToken,
      );

      //새 프로필 가져오기
      Map<String, dynamic> updatedData =
          await InMatApi.account.getProfile(testToken.accessToken);
      ProfileModel updated = ProfileModel.fromJson(updatedData);

      expect(previous, updated);
    });

    test("내가 쓴 게시글 조회", () async {
      List list = await InMatApi.account.getPosts(testToken.accessToken);
    });

    test("내가 하트찜한 음식점 조회", () async {
      List list =
          await InMatApi.account.getLikeRestaurants(testToken.accessToken);
    });

    test(
      "내가 쓴 리뷰 조회",
      () async {
        List list = await InMatApi.account.getReviews(testToken.accessToken);
      },
      skip: "내가 쓴 리뷰 조회는 서버 DB 고치고 있어서 스킵",
    );

// Registers a function to be run before tests
    setUp(() {});

// Registers a function to be run after tests
    tearDown(() {});

// Registers a function to be run once after all tests
    tearDownAll(() {});
  });
}
