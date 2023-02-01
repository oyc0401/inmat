import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/widgets/shelf.dart';

import '../restaurant/screens/restaurant.dart';

class MyFavorite extends StatefulWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  State<MyFavorite> createState() => _MyFavoriteState();
}

class _MyFavoriteState extends State<MyFavorite> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    likes = await InMatApi.account.getLikeRestaurants(InMatAuth.instance.currentUser!.token);
    complete = true;
    setState(() {});
  }

  bool complete = false;
  List<Map> likes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내가 좋아요 누른 음식점"),
      ),
      body: ListView(
        children: [
          complete ? section() : Container(),
        ],
      ),
    );
  }

  Widget section() {
    return likes.isEmpty
        ? Text("좋아요 한 음식점이 없습니다.")
        : Shelf(
            children: [
              for (Map map in likes)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                RestaurantPage(id: map['restaurantId'])));
                  },
                  title: Text(
                    "${map['restaurantName']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${map['address']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
            ],
          );
  }
}
