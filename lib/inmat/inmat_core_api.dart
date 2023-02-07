import 'package:inmat/inmat/models/profile_model.dart';

import 'inmat.dart';
import 'models/token_model.dart';
import 'inmat_api/inmat_api.dart';
import 'inmat_api/inmat_exception.dart';


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

  static dynamic doubleCheckToken(Function api) async {
    try {
      return await api();
    } on ExpirationAccessToken {
      return await api();
    }
  }

  static Future<Profile> getProfile() async {
    return await doubleCheckToken(() async {
      Token token = await Inmat.local.getValidToken();
      Map<String, dynamic> json =
          await InMatApi.user.getProfile(token.accessToken);
      Profile profile = Profile.fromJson(json);
      return profile;
    });
  }
}
