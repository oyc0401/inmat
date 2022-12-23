import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/inmat/inmat_api/restaurant/get_restaurant.dart';

import 'restaurant_model.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => RestaurantModel(id),
      child: Consumer<RestaurantModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [

              Text(Provider.of<RestaurantModel>(context).map.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
