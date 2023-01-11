import 'account/account.dart';
import 'community/community.dart';
import 'restaurant/restaurant.dart';

class InMatApi {
  InMatApi._();

  static AccountApi get account => AccountApi();

  static CommunityApi get community => CommunityApi();

  static RestaurantApi get restaurant => RestaurantApi();
}
