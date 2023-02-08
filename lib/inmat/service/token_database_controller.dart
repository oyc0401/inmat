import '../database/token_database.dart';
import '../models/token_model.dart';

class TokenDataBase {
  Future<Token?> getLocalToken() async {
    final tokenDataBase = await DataBaseToken.instance();
    Map<String, dynamic> json = tokenDataBase.read();
    if (json.isEmpty) {
      return null;
    } else {
      Token token = Token.fromJson(json);
      return token;
    }
  }

  Future<void> saveLocalToken(Token model) async {
    final tokenDataBase = await DataBaseToken.instance();
    tokenDataBase.save(model.toJson());
  }

  Future<void> delete() async {
    final tokenDataBase = await DataBaseToken.instance();
     tokenDataBase.delete();
  }
}
