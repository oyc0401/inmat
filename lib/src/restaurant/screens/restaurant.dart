import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/src/restaurant/screens/review_all.dart';
import 'package:inmat/src/restaurant/widgets/review_card.dart';
import 'package:inmat/src/restaurant/screens/write_review.dart';
import 'package:inmat/utils/inmat_colors.dart';
import 'package:inmat/widgets/shelf.dart';
import 'package:provider/provider.dart';

import '../providers/restaurant_model.dart';
import '../widgets/restaurant_title.dart';
import 'review_view.dart';

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
            backgroundColor: Colors.transparent,
            title: Text(Provider.of<RestaurantProvider>(context).name),
          ),
          body: ListView(
            children: [
              const Banner(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleSection(),
                  Container(
                    height: 9,
                    color: const Color(0xffEBEBEB),
                  ),
                  menuSection(context),
                  timeSection(),
                  const RestaurantMap(),
                  Text(
                      '${Provider.of<RestaurantProvider>(context).contactNumber}'),
                ],
              ),
              CupertinoButton(
                  child: const Text("리뷰 더보기"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ReviewAll(id: id)));
                  }),
              for (var map in Provider.of<RestaurantProvider>(context).reviews)
                ReviewCard(
                    onclick: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ReviewView(
                            restaurantId: id,
                            reviewId: map['reviewId'],
                          ),
                        ),
                      );
                    },
                    map: map),
              CupertinoButton(
                  child: const Text("리뷰 작성"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => WriteReview(id: id)));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleSection() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: RestaurantTitle(),
    );
  }

  Widget menuSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 19),
        Provider.of<RestaurantProvider>(context).complete
            ? Menus(
                menus: Provider.of<RestaurantProvider>(context).menus,
              )
            : Container(),
        const SizedBox(height: 13),
        Container(
          height: 1.5,
          color: const Color(0xffEAEAEA),
        ),
      ],
    );
  }

  Widget timeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '영업 시간',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text('오전 11시 - 22시'),
              Text.rich(
                TextSpan(
                  text: '정기휴무일 ',
                  children: [
                    TextSpan(
                      text: '없음',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colorss.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 13),
        Container(
          height: 1.5,
          color: const Color(0xffEAEAEA),
        ),
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175 - 56,
      color: Colorss.skeleton,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '메뉴',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Shelf(
            space: 5,
            children: [
              for (Map menu in menus)
                Menu(
                  menu: menu,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({Key? key, required this.menu}) : super(key: key);
  final Map menu;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${menu['menuName']}',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const Spacer(),
        Text(
          '${menu['price']}',
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
      ],
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
          decoration: const BoxDecoration(
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
