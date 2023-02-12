import 'package:flutter/cupertino.dart';
import 'package:inmat/utils/navigator_context.dart';
import 'package:inmat/utils/on_resign_in.dart';

import 'inmat_catch_excepction.dart';
import 'inmat_http.dart';
import 'inmat_token_http.dart';

part 'api/user.dart';

part 'api/community.dart';

part 'api/restaurant.dart';

part 'api/auth.dart';

part 'api/utils.dart';

class InmatApi {
  InmatApi._();

  static AuthApi get auth => AuthApi();

  static InmatUserApi get user => InmatUserApi();

  static InmatCommunityApi get community => InmatCommunityApi();

  static InmatRestaurantApi get restaurant => InmatRestaurantApi();

  static InmatUtilsApi get utils => InmatUtilsApi();


}

