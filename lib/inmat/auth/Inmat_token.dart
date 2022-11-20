import 'package:restaurant/inmat/database/token_database.dart';

class InMatToken {
  static final Map<String, dynamic> _token = {};

  Map<String, dynamic> getToken() {
    return _token;
  }

  TokenDataBase tokenDataBase = TokenDataBase();

   Future<void> downLoad() async {
    Map<String, dynamic> token = await tokenDataBase.get();
    saveToken(token);
  }

  saveToken(Map<String, dynamic> token) async {
    _token.addAll(token);
    tokenDataBase.save(token);
  }

  deleteToken() {
    _token.clear();
    tokenDataBase.delete();
  }

  bool tokenIsEmpty() {
    return _token.isEmpty;
  }
}

class InMatProfile extends InMatToken {
  static final Map<String, dynamic> _profile = {};

  getProfile() => _profile;

  saveUser(Map<String, dynamic> user) => _profile.addAll(user);

  deleteUser() => _profile.clear();
}
