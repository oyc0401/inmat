import 'package:flutter/foundation.dart';

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

  static Future<void> initializeApp() async {
    await local.initialize();
    await user.initialize();
  }

  @visibleForTesting
  static Future<void> initialTest(Token token) async {
    local.saveToken(token);
  }
}
