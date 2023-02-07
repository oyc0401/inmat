import '../../../database/token_database.dart';
import '../model/token_model.dart';

class TokenDataBase {
  static final DataBaseToken _tokenDataBase = DataBaseToken();

  Future<TokenModel?> getLocalToken() async {
    Map<String, dynamic> json = await _tokenDataBase.get();
    if (json.isEmpty) {
      return null;
    } else {
      TokenModel token = TokenModel.fromJson(json);
      return token;
    }
  }

  Future<void> saveLocalToken(TokenModel model) async {
    _tokenDataBase.save(model.toJson());
  }

  Future<void> delete() async {
    await _tokenDataBase.delete();
  }
}
