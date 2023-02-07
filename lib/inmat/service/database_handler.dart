import '../database/token_database.dart';
import '../models/token_model.dart';

class TokenDataBase{
   final DataBaseToken _tokenDataBase = DataBaseToken();

  Future<Token?> getLocalToken() async {
    Map<String, dynamic> json = await _tokenDataBase.get();
    if (json.isEmpty) {
      return null;
    } else {
      Token token = Token.fromJson(json);
      return token;
    }
  }

  Future<void> saveLocalToken(Token model) async {
    _tokenDataBase.save(model.toJson());
  }

  Future<void> delete() async {
    await _tokenDataBase.delete();
  }
}
