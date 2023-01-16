import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/src/restaurant/write_review/write_review.dart';
import 'package:provider/provider.dart';

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
      create: (BuildContext context) => RestaurantProvider(id),
      child: Consumer<RestaurantProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: Text(Provider.of<RestaurantProvider>(context).name),
          ),
          body: ListView(
            children: [
              Banner(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Provider.of<RestaurantProvider>(context).name),
                    Text('${Provider.of<RestaurantProvider>(context).type}'),
                    IconButton(
                      onPressed: () {
                        Provider.of<RestaurantProvider>(context, listen: false)
                            .like();
                        Provider.of<RestaurantProvider>(context, listen: false)
                            .postHeart();
                      },
                      icon: Provider.of<RestaurantProvider>(context).heart
                          ? Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                            )
                          : Icon(Icons.favorite_border),
                    ),
                    Text(
                        '별점: ${Provider.of<RestaurantProvider>(context).averageStar}'),
                    Text(
                        '평균 가격: ${Provider.of<RestaurantProvider>(context).averagePrice}'),
                    Text(
                        '복잡도: ${Provider.of<RestaurantProvider>(context).complexity}'),
                    Text('${Provider.of<RestaurantProvider>(context).heart}'),
                    Provider.of<RestaurantProvider>(context).complete
                        ? Menus(
                            menus:
                                Provider.of<RestaurantProvider>(context).menus,
                          )
                        : Container(),
                    RestaurantMap(),
                    Text(
                        '${Provider.of<RestaurantProvider>(context).contactNumber}'),
                  ],
                ),
              ),
              for (var map in Provider.of<RestaurantProvider>(context).reviews)
                ListTile(title: Text('${map}',style: TextStyle(fontSize: 12),),),

              CupertinoButton(
                  child: Text("리뷰 작성"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => WriteReview(
                                  id: id,
                                )));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      color: Colors.grey,
      child: Center(
          child:
              Text('사진: ${Provider.of<RestaurantProvider>(context).images}')),
    );
  }
}

class Menus extends StatelessWidget {
  const Menus({
    Key? key,
    required this.menus,
  }) : super(key: key);

  final List menus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        for (Map menu in menus)
          Menu(
            menu: menu,
          ),
      ]),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.menu}) : super(key: key);
  final Map menu;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${menu['menuName']}'),
      subtitle: Text('${menu['price']}'),
    );
  }
}

class RestaurantMap extends StatelessWidget {
  const RestaurantMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Provider.of<RestaurantProvider>(context).address),
        Container(
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xffeeeeee),
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
          ),
          child: Center(
            child: Column(
              children: [
                Text('${Provider.of<RestaurantProvider>(context).longitude}'),
                Text('${Provider.of<RestaurantProvider>(context).latitude}'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
