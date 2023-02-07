
import '../inmat.dart';
import '../inmat_api_token.dart';
import '../models/profile_model.dart';
import '../models/token_model.dart';
import 'inmat_http.dart';
import 'inmat_token_http.dart';

part 'api/user.dart';

part 'api/community.dart';

part 'api/restaurant.dart';

part 'api/auth.dart';

part 'api/utils.dart';


part 'model_api/user.dart';

part 'model_api/community.dart';

part 'model_api/restaurant.dart';

part 'model_api/utils.dart';

class InMatPureApi {
  InMatPureApi._();

  static UserApi get user => UserApi();

  static CommunityApi get community => CommunityApi();

  static RestaurantApi get restaurant => RestaurantApi();

  static AuthApi get auth => AuthApi();

  static UtilsApi get utils => UtilsApi();
}


class InmatApi {
  InmatApi._();

  static InmatUserApi get user => InmatUserApi();

  static InmatCommunityApi get community => InmatCommunityApi();

  static InmatRestaurantApi get restaurant => InmatRestaurantApi();

  static InmatUtilsApi get utils => InmatUtilsApi();
}

