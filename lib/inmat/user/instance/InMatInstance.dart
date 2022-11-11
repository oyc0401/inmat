class InMatInstance {
  InMatInstance();

  static Map<String, dynamic> _user = {};

  Map<String, dynamic> get user {
    return _user;
  }

  set user( Map<String, dynamic> u) {_user = u;}


  setToken(String token){
    _user['token']=token;
  }
}
