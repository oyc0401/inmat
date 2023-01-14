import 'package:flutter/material.dart';

class RestaurantBanner extends StatelessWidget {
  const RestaurantBanner({Key? key, required this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Color(0xffFF8C66),
      child: Center(
          child: Text(
            'imageUrl',
            // style: TextStyle(
            //     fontSize: 21, fontWeight: FontWeight.w700, color: Colors.white),
          )),
    );
  }
}
