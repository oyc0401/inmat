import 'package:flutter/foundation.dart';
import 'package:inmat/inmat/models/profile_model.dart';

import 'inmat_data.dart';
import 'inmat_local.dart';
import 'inmat_local_interface.dart';
import 'models/token_model.dart';

class Inmat {
  Inmat._();

  static InmatData? _delegateData;

  static InmatLocalInterface local = InmatLocal();

  static InmatData get user {
    return _delegateData ??= InmatData(local);
  }

  static Future<void> initialize() async {
    await local.initialize();
    await user.initialize();
  }

  static Future<void> testInitial(Token token) async {
    local.saveToken(token);
    user.setProfile(
      Profile(
        userId: 34,
        username: "username",
        email: "email",
        phoneNumber: "phoneNumber",
        nickName: "nickName",
        age: 2,
        gender: "gender",
        profileImgUrl: "profileImgUrl",
      ),
    );
    user.authStatus=AuthStatus.user;
  }
}
