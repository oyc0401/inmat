
import 'inmat_http.dart';

part 'api/user.dart';

part 'api/community.dart';

part 'api/restaurant.dart';

part 'api/auth.dart';

part 'api/utils.dart';

class InMatApi {
  InMatApi._();

  static UserApi get user => UserApi();

  static CommunityApi get community => CommunityApi();

  static RestaurantApi get restaurant => RestaurantApi();

  static AuthApi get auth => AuthApi();

  static UtilsApi get utils => UtilsApi();
}

// class InMatTokenApi extends InMatHttp {
//   InMatTokenApi(
//     super.how, {
//     required super.url,
//     String? message,
//     super.body,
//     super.refreshToken,
//     super.deviceIdentifier,
//   }) {
//     // super.token=InMatAuth.instance.currentUser?.token;
//     //
//   }
//
//   validateToken() async {
//     User? current = InmatAuth.instance.currentUser;
//     if (current == null) return;
//
//     String accessToken = current.accessToken;
//
//     DateTime? expiryDate = Jwt.getExpiryDate(accessToken);
//
//     print(expiryDate);
//
//     DateTime now = DateTime.now();
//
//     if (expiryDate == null) return;
//
//     Duration difference = expiryDate.difference(now);
//
//     print(difference);
//
//     if (difference.isNegative) {
//
//
//
//     } else {}
//   }
// }
