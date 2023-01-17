import '../../../database/token_database.dart';
import '../model/token_model.dart';

class DataBaseHandler{
  static final TokenDataBase _tokenDataBase = TokenDataBase();

  static Future<void> saveDBToken(TokenModel model) async {
    _tokenDataBase.save(model.toJson());
  }


  static Future<void> delete()async{
    await _tokenDataBase.delete();
  }
}