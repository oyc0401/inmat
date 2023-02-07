import 'package:jwt_decode/jwt_decode.dart';

import '../inmat/models/token_model.dart';
import '../inmat/inmat_api/inmat_api.dart';

class RefreshTokenIssue {
  static Future<Token> getValidToken(
      Token token, String deviceIdentifier) async {
    DateTime? expiryDate = Jwt.getExpiryDate(token.accessToken);

    print(expiryDate);
    if (expiryDate == null) {
      throw Exception("토큰이 이상해요!");
    }

    DateTime now = DateTime.now();

    Duration difference = expiryDate.difference(now);

    print(difference);

    if (difference.isNegative) {
      //리프레시 토큰 재발급

      Map<String, dynamic> json = await InMatApi.auth.issue(
        accessToken: token.accessToken,
        refreshToken: token.refreshToken,
        deviceIdentifier: deviceIdentifier,
      );

      Token newToken = Token.fromJson(json);
      return newToken;
    }

    return token;
  }
}
