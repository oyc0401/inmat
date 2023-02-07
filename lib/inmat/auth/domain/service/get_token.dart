import 'package:inmat/utils/mobile_id.dart';

import '../../../database/token_database.dart';
import '../../../inmat_api/inmat_api.dart';
import '../model/profile_model.dart';
import '../model/token_model.dart';

class GetToken {

  static Future<Profile> getProfile(String accessToken) async {
    Map<String, dynamic> map =
        await InMatApi.user.getProfile(accessToken);

    Profile model = Profile.fromJson(map);
    return model;
  }

  static Future<Token> getTokenEmail(String id, String password, String deviceIdentifier) async {
    Map<String, dynamic> json = await InMatApi.auth.login(
      id: id,
      password: password,
      deviceIdentifier: deviceIdentifier
    );
    Token tokenModel = Token.fromJson(json);
    return tokenModel;
  }
}
