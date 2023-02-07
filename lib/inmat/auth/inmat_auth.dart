import 'package:inmat/inmat/inmat_library.dart';

import 'user_model.dart';

import 'package:jwt_decode/jwt_decode.dart';

import 'domain/model/profile_model.dart';
import 'domain/model/token_model.dart';
import 'domain/service/get_token.dart';

import '../inmat_api/inmat_api.dart';

class InmatAuth {
  InmatAuth(this.data);

  InmatData data;

  static InmatAuth get instance => InmatAuth(Inmat.user);

  User? get currentUser {
    if (data.tokenController.tokenIsEmpty) {
      return null;
    }
    assert(data.profileController.profile != null &&
        data.tokenController.token != null);

    return User(
      profileModel: data.profileController.profile!,
      tokenModel: data.tokenController.token!,
    );
  }

  void signOut() {
    data.dataBase.delete();
    data.tokenController.clear();
    data.profileController.clear();
  }

  Future<void> signInEmail(String id, String password) async {
    TokenModel tokenModel =
    await GetToken.getTokenEmail(id, password, data.deviceIdentifier);

    data.tokenController.set(tokenModel);
    await data.dataBase.saveLocalToken(tokenModel);

    // jwt decode
    String token = tokenModel.accessToken;
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);

    // [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만
    // 여기선 로그인 직후에 가져오는 것이라 생략한다.
    ProfileModel profile = await GetToken.getProfile(tokenModel.accessToken);
    data.profileController.set(profile);
  }

  Future<void> regenerateToken() async {
    TokenModel? token = data.tokenController.token;
    if (token == null) {
      throw Exception("토큰을 재발급 하려는데 현재 토큰이 없습니다.");
    }

    Map<String, dynamic> json = await InMatApi.auth.issue(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      deviceIdentifier: data.deviceIdentifier,
    );

    TokenModel newToken = TokenModel.fromJson(json);

    data.tokenController.set(newToken);
  }

  Future<void> updateProfile({
    required int age,
    required String gender,
    required String nickName,
    required String? profileImgUrl,
  }) async {
    await InMatApi.user.updateProfile(
      age: age,
      gender: gender,
      nickName: nickName,
      profileImgUrl: profileImgUrl,
      token: data.tokenController.token!.accessToken,
    );
    data.profileController.set(
      ProfileModel(
        age: age,
        gender: gender,
        nickName: nickName,
        profileImgUrl: profileImgUrl,
        phoneNumber: data.profileController.profile!.phoneNumber,
        email: data.profileController.profile!.email,
        userId: data.profileController.profile!.userId,
        username: data.profileController.profile!.username,
      ),
    );
  }
}
