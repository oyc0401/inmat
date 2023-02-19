import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:inmat/utils/inmat_colors.dart';
import 'package:provider/provider.dart';

import '../../restaurant/screens/restaurant.dart';
import '../model/review_model.dart';
import '../providers/home_view_model.dart';

class RecentReview extends StatelessWidget {
  const RecentReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (ReviewModel model
              in Provider.of<HomeViewModel>(context).recentReviews)
            ReviewCard(
              restaurantId: model.restaurantId,
              reviewId: model.reviewId,
              imageUrl: model.imgUrl,
              nickname: model.nickName,
              restaurant: model.restaurantName,
              review: model.contents,
            )
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    Key? key,
    required this.reviewId,
    required this.imageUrl,
    required this.nickname,
    required this.restaurant,
    required this.review,
    required this.restaurantId,
  }) : super(key: key);
  final int restaurantId;
  final int reviewId;
  final String? imageUrl;
  final String nickname;
  final String restaurant;
  final String review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (builder) => RestaurantPage(id: restaurantId),
            ),
          );
        },
        borderRadius: BorderRadius.circular(13),
        child: Ink(
          padding: const EdgeInsets.only(left: 17, right: 15, top: 19),
          width: 292,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: const Color(0xffEAEAEA), width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 136,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant,
                      style: const TextStyle(
                          fontSize: 11, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 1),
                    const Text('no data',
                        style:
                            TextStyle(fontSize: 9, color: Color(0xffAFAFAF))),
                    SizedBox(height: 5),
                    Text(
                      '$review @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    Container(
                      height: 13,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_circle_rounded,
                            color: Colorss.primaryColor,
                            size: 13,
                          ),
                          Text(
                            nickname,
                            style: const TextStyle(
                                color: Color(0xffAFAFAF), fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colorss.skeleton,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: Text('$imageUrl')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
