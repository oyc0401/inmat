import 'package:flutter_test/flutter_test.dart';
import 'package:inmat/inmat/models/profile_model.dart';
import 'package:inmat/inmat/models/token_model.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/profile/models/my_favorite_model.dart';
import 'package:inmat/src/profile/models/my_review_model.dart';
import 'package:inmat/src/profile/models/posts_model.dart';

void main() {
  group("user api 테스트", () {
    late Token testToken;

    // const String testId = "flutter1";
    // const String testPassword = "qwe12345&&";
    // const String testDeviceIdentifier = "dart_pad";

    const String testId = "test123";
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

    test("로그인", () async {
      Map<String, dynamic> loginData = await InMatApi.auth.login(
        id: testId,
        password: testPassword,
        deviceIdentifier: testDeviceIdentifier,
      );

      testToken = Token.fromJson(loginData);
    });

    test("프로필 불러오기", () async {
      Map<String, dynamic> json =
          await InMatApi.user.getProfile(testToken.accessToken);

      Profile model = Profile.fromJson(json);
    });

    test(
      "프로필 수정하기",
      () async {
        int age = 22;
        String gender = "M";
        String nickName = "플러터하나나";
        String? profileImgUrl =
            "https://inmat.s3.ap-northeast-1.amazonaws.com/everytime-1664774769329.jpg";

        // 프로필 업데이트
        await InMatApi.user.updateProfile(
          age: age,
          gender: gender,
          nickName: nickName,
          profileImgUrl: profileImgUrl,
          token: testToken.accessToken,
        );
      },
      skip: "이미 있는 계정이라 프로필 업데이트는 스킵",
    );

    test("내가 쓴 게시글 조회", () async {
      List<Map<String, dynamic>> list =
          await InMatApi.user.getPosts(testToken.accessToken);
      // List<PostThumbModel> posts = [];
      //
      // for (Map<String, dynamic> json in list) {
      //   posts.add(PostThumbModel.fromJson(json));
      // }

      List<MyPostModel> posts =
          list.map((e) => MyPostModel.fromJson(e)).toList();
    });

    test("내가 하트찜한 음식점 조회", () async {
      List<Map<String, dynamic>> list =
          await InMatApi.user.getLikeRestaurants(testToken.accessToken);

      List<MyFavoriteModel> likes =
          list.map((e) => MyFavoriteModel.fromJson(e)).toList();
    });

    test(
      "내가 쓴 리뷰 조회",
      () async {
        List<Map<String, dynamic>> list =
            await InMatApi.user.getReviews(testToken.accessToken);

        List<MyReviewModel> reviews =
            list.map((e) => MyReviewModel.fromJson(e)).toList();
      },
    );

    test(
      "프로필 수정하기 비교",
      () async {
        int age = 22;
        String gender = "M";
        String nickName = "플러터하나나";
        String? profileImgUrl = null;

        //기존 프로필 가져오기
        Map<String, dynamic> data =
            await InMatApi.user.getProfile(testToken.accessToken);
        Profile model = Profile.fromJson(data);

        Profile previous = Profile(
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
        await InMatApi.user.updateProfile(
          age: age,
          gender: gender,
          nickName: nickName,
          profileImgUrl: profileImgUrl,
          token: testToken.accessToken,
        );

        //새 프로필 가져오기
        Map<String, dynamic> updatedData =
            await InMatApi.user.getProfile(testToken.accessToken);
        Profile updated = Profile.fromJson(updatedData);

        expect(previous, updated);
      },
      skip: "이미 있는 계정이라 프로필 업데이트는 스킵",
    );

// Registers a function to be run before tests
    setUp(() {});

// Registers a function to be run after tests
    tearDown(() {});

// Registers a function to be run once after all tests
    tearDownAll(() {});
  });
}
