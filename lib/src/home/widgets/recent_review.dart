import 'package:flutter/material.dart';
import 'package:inmat/src/home/domain/model/review_model.dart';
import 'package:provider/provider.dart';

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
              id: model.reviewId,
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
    return Container(
      margin: const EdgeInsets.only(left: 12),
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
                    style: TextStyle(fontSize: 9, color: Color(0xffAFAFAF))),
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
                        color: Color(0xffFF8C66),
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
              color: Colors.grey,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(child: Text('$imageUrl')),
          ),
        ],
      ),
    );
  }
}
