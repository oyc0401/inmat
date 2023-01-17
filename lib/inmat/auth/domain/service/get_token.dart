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
        await InMatApi.account.getProfile(token: accessToken);

    ProfileModel model = ProfileModel.fromJson(map);
    return model;
  }

  static Future<TokenModel> getTokenEmail(String id, String password) async {
    Map<String, dynamic> json = await InMatApi.account.emailSignIn(
      id: id,
      password: password,
    );
    TokenModel tokenModel = TokenModel.fromJson(json);
    return tokenModel;
  }
}
