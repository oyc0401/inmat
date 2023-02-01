import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/restaurant/screens/review_view.dart';
import 'package:inmat/widgets/shelf.dart';

class MyReview extends StatefulWidget {
  const MyReview({Key? key}) : super(key: key);

  @override
  State<MyReview> createState() => _MyReviewState();
}

class _MyReviewState extends State<MyReview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    reviews = await InMatApi.account.getReviews(InMatAuth.instance.currentUser!.token);
    complete = true;
    setState(() {});
  }

  bool complete = false;
  List<Map> reviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내가 쓴 리뷰"),
      ),
      body: ListView(
        children: [
          complete ? section() : Container(),
        ],
      ),
    );
  }

  Widget section() {
    return reviews.isEmpty
        ? Text("쓴 리뷰가 아직 없습니다.")
        : Shelf(
            children: [
              for (Map map in reviews)
                ListTile(
                  onTap: (){
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => ReviewView(reviewId: map['reviewId'],
                            restaurantId: map['restaurantId'],
                            )));
                  },
                  title: Text(
                    "${map['restaurantName']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${map['contents']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),


            ],
          );
  }
}
