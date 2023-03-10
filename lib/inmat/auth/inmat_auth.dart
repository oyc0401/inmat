import 'package:inmat/inmat/exception/inmat_exception.dart';
import 'package:inmat/inmat/inmat_local_interface.dart';

import '../inmat.dart';
import '../inmat_data.dart';
import '../inmat_local.dart';
import 'user.dart';

import 'package:jwt_decode/jwt_decode.dart';

import '../models/profile_model.dart';
import '../models/token_model.dart';
import '../service/get_token.dart';

import '../inmat_api/inmat_api_library.dart';

class InmatAuth {
  InmatAuth(this.data, this.local);

  InmatData data;
  InmatLocalInterface local;

  static InmatAuth get instance => InmatAuth(Inmat.user, Inmat.local);

  User? get currentUser {
    if (local.tokenIsEmpty) {
      return null;
    }
    assert(data.profile != null && !local.tokenIsEmpty);

    return User(
      profileModel: data.profile!,
      tokenModel: local.currentToken!,
    );
  }

  Future<void> logout() async {
    clear();
    try{
      await InmatApi.auth.logout();
    }on AccessDenied{
      print("로그아웃을 하는데 토큰이 만료되어서 오류가 발생했습니다.");
    }

  }

  void clear()  {
    local.clearToken();
    data.clearProfile();
  }

  Future<void> signInEmail(String email, String password) async {
    Token tokenModel =
        await GetToken.getTokenEmail(email, password, local.deviceIdentifier);

    local.saveToken(tokenModel);

    // jwt decode
    String token = tokenModel.accessToken;
    Map<String, dynamic> payload = Jwt.parseJwt(token);
    print(payload);

    // [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만
    // 여기선 로그인 직후에 가져오는 것이라 생략한다.
    Profile profile = await GetToken.getProfile();
    data.setProfile(profile);
  }

  Future<void> updateProfile({
    required int age,
    required String gender,
    required String nickName,
    required String? profileImgUrl,
  }) async {
    await InmatApi.user.updateProfile(
      age: age,
      gender: gender,
      nickName: nickName,
      profileImgUrl: profileImgUrl,
    );
    data.setProfile(
      Profile(
        age: age,
        gender: gender,
        nickName: nickName,
        profileImgUrl: profileImgUrl,
        // phoneNumber: data.profile!.phoneNumber,
        email: data.profile!.email,
        userId: data.profile!.userId,
        // username: data.profile!.username,
      ),
    );
  }
}
