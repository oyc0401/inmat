import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main/main_model.dart';

class ServerHome extends StatelessWidget {
  const ServerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("인맛 InMat"),
      ),
      body: ListView(
        children: [
          // Text(Provider.of<HomeModel>(context).json.toString()),
          Container(
            color: Colors.greenAccent,
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (Map map in Provider.of<HomeModel>(context).banners)
                  Banner(imageUrl: map['bannerUrl'])
              ],
            ),
          ),

          Container(
            color: Colors.orangeAccent,
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (Map map in Provider.of<HomeModel>(context).toDayRecommends)
                  TodayMenu(
                    id: map['recommendId'],
                    imageUrl: map['imgUrl'],
                    food: map['foodName'],
                  )
              ],
            ),
          ),
          Container(
            color: Colors.lightBlueAccent,
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (Map map in Provider.of<HomeModel>(context).recentReviews)
                  RecentReview(
                    id: map['reviewId'],
                    imageUrl: map['imgUrl'],
                    nickname: map['nickName'],
                    restaurant: map['restaurantName'],
                    review: map['contents'],
                  )
              ],
            ),
          ),
          Container(
            color: Colors.yellowAccent,
            child: Column(
              children: [
                for (Map map in Provider.of<HomeModel>(context).restaurants)
                  RestaurantCard(
                    id: map['restaurantId'],
                    imageUrl: map['profileImgUrl'],
                    restaurant: map['restaurantName'],
                    address: map['address'],
                    averageStar: map['averageStar'],
                    reviewCount: map['countReview'],
                    averagePrice: map['averagePrice'],
                    type: map['restaurantType'],
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TodayMenu extends StatelessWidget {
  const TodayMenu(
      {Key? key, required this.id, required this.imageUrl, required this.food})
      : super(key: key);
  final int id;
  final String? imageUrl;

  final String food;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(id.toString()),
        Text(imageUrl ?? "null"),
        Text(food),
      ],
    );
  }
}

class RecentReview extends StatelessWidget {
  const RecentReview({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.nickname,
    required this.restaurant,
    required this.review,
  }) : super(key: key);
  final int id;
  final String? imageUrl;
  final String nickname;
  final String restaurant;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(id.toString()),
        Text(imageUrl ?? "null"),
        Text(nickname),
        Text(restaurant),
        Text(review),
      ],
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({Key? key, required this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Text(imageUrl ?? 'null');
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.restaurant,
    required this.address,
    required this.averageStar,
    required this.reviewCount,
    required this.averagePrice,
    required this.type,
  }) : super(key: key);
  final int? id;
  final String? imageUrl;
  final String restaurant;
  final String? address;
  final double? averageStar;
  final int? reviewCount;
  final int? averagePrice;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(id.toString()),
        Text(imageUrl ?? "null"),
        Text(restaurant),
        Text(address??'null'),
        Text(averageStar.toString()),
        Text(reviewCount.toString()),
        Text(averagePrice.toString()),
        Text(type),
      ],
    );
  }
}
