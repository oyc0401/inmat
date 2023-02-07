import '../../../database/token_database.dart';
import '../../../models/token_model.dart';



class TokenDataBase{
   final DataBaseToken _tokenDataBase = DataBaseToken();

  @override
  Future<Token?> getLocalToken() async {
    Map<String, dynamic> json = await _tokenDataBase.get();
    if (json.isEmpty) {
      return null;
    } else {
      Token token = Token.fromJson(json);
      return token;
    }
  }

  @override
  Future<void> saveLocalToken(Token model) async {
    _tokenDataBase.save(model.toJson());
  }

  @override
  Future<void> delete() async {
    await _tokenDataBase.delete();
  }
}
