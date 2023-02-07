
import 'models/token_model.dart';
import 'inmat_api/inmat_api.dart';

class InmatCoreApi {
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
