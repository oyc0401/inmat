import '../models/profile_model.dart';
import '../models/token_model.dart';

class User {
  User({
    required this.profileModel,
    required this.tokenModel,
  });

  final Profile profileModel;
  final Token tokenModel;

  int get age => profileModel.age;

  String get gender => profileModel.gender;

  String get nickName => profileModel.nickName;

  String? get profileImgUrl => profileModel.profileImgUrl;

  String get accessToken => tokenModel.accessToken;

  String get refreshToken => tokenModel.refreshToken;



  @override
  String toString() {
    return "User (age: $age, gender: $gender, nickName: $nickName, profileImgUrl: $profileImgUrl, accessToken: $accessToken, refreshToken: $refreshToken)";
  }
}
