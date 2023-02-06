import '../../../database/token_database.dart';
import '../model/token_model.dart';

class DataBaseHandler{
  static final TokenDataBase _tokenDataBase = TokenDataBase();

   Future<void> saveDBToken(TokenModel model) async {
    _tokenDataBase.save(model.toJson());
  }


   Future<void> delete()async{
    await _tokenDataBase.delete();
  }
}