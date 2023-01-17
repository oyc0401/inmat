
import 'domain/model/profile_model.dart';
import 'domain/model/token_model.dart';

class User {
  User({
    required this.profileModel,
    required this.tokenModel,
  });

  final ProfileModel profileModel;
  final TokenModel tokenModel;

  int get age => profileModel.age;

  String get gender => profileModel.gender;
  String get nickName => profileModel.nickName;

  String? get profileImgUrl => profileModel.profileImgUrl??'null';

  String get token => tokenModel.token ;

  // Map<String, dynamic> toMap() {
  //   Map<String, dynamic> newMap={};
  //   newMap.addAll(_user);
  //   newMap.remove('token');
  //
  //   return newMap;
  // }

  @override
  String toString() {
    return "age: $age, gender: $gender, nickName: $nickName, profileImgUrl: $profileImgUrl, token: $token";
  }
}

class UUU {
  int _age;
  String _email;

  UUU(this._age, this._email);

  String get email => _email;

  int get age => _age;
}
