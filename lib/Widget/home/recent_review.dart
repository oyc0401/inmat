import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main/main_model.dart';

class RecentReview extends StatelessWidget {
  const RecentReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (Map map in Provider.of<HomeModel>(context).recentReviews)
            ReviewCard(
              id: map['reviewId'],
              imageUrl: map['imgUrl'],
              nickname: map['nickName'],
              restaurant: map['restaurantName'],
              review: map['contents'],
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
      margin: const EdgeInsets.only(left: 14),
      padding: const EdgeInsets.only(left: 20, right: 17, top: 26, bottom: 23),
      width: 342,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xffEAEAEA), width: 1.3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 163,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const Text('null',
                    style: TextStyle(fontSize: 11, color: Color(0xffAFAFAF))),
                Expanded(
                  child: Text(
                    '$review @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.account_circle_rounded,
                      color: Color(0xffFF8C66),
                      size: 15,
                    ),
                    Text(
                      nickname,
                      style:
                          const TextStyle(color: Color(0xffAFAFAF), fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),

          Container(
            width: 106,
            height: 106,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(child: Text('$imageUrl')),
          ),
          // Text(key['title']),
          // ),
          // Container(
          //   width: 150,
          //   height: 150,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     border: Border.all(color: Colors.grey, width: 3),
          //   ),
          //   child: Image.network(
          //       'https://pup-review-phinf.pstatic.net/MjAyMjA1MDZfMjQ0/MDAxNjUxODI3NjIwNzM0.IVIBlJrJ3WaZO_7BDt0QmtzH1l2yeMLQpiJu6CdM5Hcg.J-ybgwfs3Lvg3GZyFcWtqDLnReL5rMpUKwazK_L8Vzgg.JPEG/upload_0e29ddeb4a1e8137ba5300de9aaea9f1.jpg',
          //   fit: BoxFit.fill,),),
        ],
      ),
    );
  }
}
