import '../auth/inmat_auth.dart';

import 'inmat_http.dart';

part 'api/account.dart';

part 'api/community.dart';

part 'api/restaurant.dart';

class InMatApi {
  InMatApi._();

  static AccountApi get account => AccountApi();

  static CommunityApi get community => CommunityApi();

  static RestaurantApi get restaurant => RestaurantApi();
}
