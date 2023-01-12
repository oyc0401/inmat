

import 'api/account.dart';
import 'api/community.dart';
import 'api/restaurant.dart';

class InMatApi {
  InMatApi._();

  static AccountApi get account => AccountApi();

  static CommunityApi get community => CommunityApi();

  static RestaurantApi get restaurant => RestaurantApi();
}
