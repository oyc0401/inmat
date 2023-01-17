import 'package:flutter/material.dart';
import 'package:inmat/utils/inmat_colors.dart';

class RestaurantBanner extends StatelessWidget {
  const RestaurantBanner({Key? key, required this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colorss.primaryColor,
      child: Center(
          child: Text(
            'imageUrl',
            // style: TextStyle(
            //     fontSize: 21, fontWeight: FontWeight.w700, color: Colors.white),
          )),
    );
  }
}
