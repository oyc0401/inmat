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

  String? get profileImgUrl => profileModel.profileImgUrl;

  String get token => tokenModel.token;

  @override
  String toString() {
    return "User (age: $age, gender: $gender, nickName: $nickName, profileImgUrl: $profileImgUrl, token: $token)";
  }
}
