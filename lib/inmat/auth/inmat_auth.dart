
import '../inmat.dart';
import '../inmat_data.dart';
import '../inmat_local.dart';
import 'user_model.dart';

import 'package:jwt_decode/jwt_decode.dart';

import '../models/profile_model.dart';
import '../models/token_model.dart';
import 'domain/service/get_token.dart';

import '../inmat_api/inmat_api.dart';

class InmatAuth {
  InmatAuth(this.data,this.local);

  InmatData data;
  InmatLocal local;

  static InmatAuth get instance => InmatAuth(Inmat.user,Inmat.local);

  User? get currentUser {
    if (local.tokenIsEmpty()) {
      return null;
    }
    assert(data.profileController.profile != null &&
        local.currentToken != null);

    return User(
      profileModel: data.profileController.profile!,
      tokenModel: local.currentToken!,
    );
  }

  void signOut() {
    local.dataBase.delete();
    local.clearToken();
    data.profileController.clear();
  }

  Future<void> signInEmail(String id, String password) async {
    Token tokenModel =
    await GetToken.getTokenEmail(id, password, local.deviceIdentifier);

    local.setToken(tokenModel);
    await local.dataBase.saveLocalToken(tokenModel);

    // jwt decode
    String token = tokenModel.accessToken;
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);

    // [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만
    // 여기선 로그인 직후에 가져오는 것이라 생략한다.
    Profile profile = await GetToken.getProfile(tokenModel.accessToken);
    data.profileController.set(profile);
  }

  // Future<void> regenerateToken() async {
  //   Token? token = local.token;
  //   if (token == null) {
  //     throw Exception("토큰을 재발급 하려는데 현재 토큰이 없습니다.");
  //   }
  //
  //   Map<String, dynamic> json = await InMatApi.auth.issue(
  //     accessToken: token.accessToken,
  //     refreshToken: token.refreshToken,
  //     deviceIdentifier: data.deviceIdentifier,
  //   );
  //
  //   Token newToken = Token.fromJson(json);
  //
  //   data.setToken(newToken);
  // }

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
      token: local.currentToken!.accessToken,
    );
    data.profileController.set(
      Profile(
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
