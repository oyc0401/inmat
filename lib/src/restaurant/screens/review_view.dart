import 'package:flutter/material.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class ReviewView extends StatefulWidget {
  const ReviewView(
      {Key? key, required this.restaurantId, required this.reviewId})
      : super(key: key);

  final int restaurantId;
  final int reviewId;

  @override
  State<ReviewView> createState() => _ReviewViewState();
}

class _ReviewViewState extends State<ReviewView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Map map = {};

  init() async {
    map = await InmatApi.restaurant.getReview(
        restaurantId: widget.restaurantId, reviewId: widget.reviewId);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('rest id: ${widget.restaurantId}, review id: ${widget.reviewId}'),
      ),
      body: Container(
        child: Center(
          child: Text('$map'),
        ),
      ),
    );
  }
}
