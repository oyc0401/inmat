import 'package:inmat/inmat/auth/domain/model/profile_model.dart';

import 'auth/domain/model/token_model.dart';
import 'inmat_api/inmat_api.dart';
import 'inmat_api/inmat_exception.dart';
import 'inmat_library.dart';

class InmatCoreApi {
  static Future<Token> issueToken(Token token, String deviceIdentifier) async {
    Map<String, dynamic> json = await InMatApi.auth.issue(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      deviceIdentifier: deviceIdentifier,
    );

    Token newToken = Token.fromJson(json);

    return newToken;
  }

  static Future<Profile> getProfile() async {
    try {
      Token token = await Inmat.local.getValidToken();
      Map<String, dynamic> json =
          await InMatApi.user.getProfile(token.accessToken);
      Profile profile = Profile.fromJson(json);
      return profile;
    } on ExpirationAccessToken {
      Token token = await Inmat.local.getValidToken();
      Map<String, dynamic> json =
          await InMatApi.user.getProfile(token.accessToken);
      Profile profile = Profile.fromJson(json);
      return profile;
    }
  }
}
