import 'package:inmat/utils/mobile_id.dart';

import '../../../database/token_database.dart';
import '../../../inmat_api/inmat_api.dart';
import '../model/profile_model.dart';
import '../model/token_model.dart';

class GetToken {
  static Future<TokenModel?> getTokenInDB() async {
    TokenDataBase dataBase = TokenDataBase();
    Map<String, dynamic> json = await dataBase.get();
    if (json.isEmpty) {
      return null;
    } else {
      TokenModel token = TokenModel.fromJson(json);
      return token;
    }
  }

  static Future<ProfileModel> getProfile(String accessToken) async {
    Map<String, dynamic> map =
        await InMatApi.user.getProfile(accessToken);

    ProfileModel model = ProfileModel.fromJson(map);
    return model;
  }

  static Future<TokenModel> getTokenEmail(String id, String password) async {
    String deviceIdentifier = await MobileId.getMobileId();

    Map<String, dynamic> json = await InMatApi.auth.login(
      id: id,
      password: password,
      deviceIdentifier: deviceIdentifier
    );
    TokenModel tokenModel = TokenModel.fromJson(json);
    return tokenModel;
  }
}
