import '../inmat_api/inmat_api_library.dart';
import '../models/profile_model.dart';
import '../models/token_model.dart';

class GetToken {
  static Future<Profile> getProfile() async {
    Map<String, dynamic> map = await InmatApi.user.getProfile();

    Profile model = Profile.fromJson(map);
    return model;
  }

  static Future<Token> getTokenEmail(
      String id, String password, String deviceIdentifier) async {
    Map<String, dynamic> json = await InmatApi.auth
        .login(id: id, password: password, deviceIdentifier: deviceIdentifier);
    Token tokenModel = Token.fromJson(json);
    return tokenModel;
  }

  static Future<Token> issueToken(Token token, String deviceIdentifier) async {
    Map<String, dynamic> json = await InmatApi.auth.issue(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      deviceIdentifier: deviceIdentifier,
    );

    Token newToken = Token.fromJson(json);

    return newToken;
  }
}
