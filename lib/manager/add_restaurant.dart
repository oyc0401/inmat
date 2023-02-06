import 'package:flutter/material.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class AddRestaurant extends StatefulWidget {
  const AddRestaurant({Key? key}) : super(key: key);

  @override
  State<AddRestaurant> createState() => _AddRestaurantState();
}

class _AddRestaurantState extends State<AddRestaurant> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    print(InmatAuth.instance.currentUser);
    await InMatApi.restaurant.addRestaurant(
      {
        "address": "미추홀구 1번길 1",
        "contactNumber": "010-1234-5678",
        "imgUrl": "www.test.test",
        "latitude": 36,
        "longitude": 36,
        "restaurantMenuList": [
          {"categoryId": 1, "menuName": "탕수육", "price": 10000}
        ],
        "restaurantName": "테스트음식점",
        "restaurantType": "FOOD"
      },
      InmatAuth.instance.currentUser!.accessToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
