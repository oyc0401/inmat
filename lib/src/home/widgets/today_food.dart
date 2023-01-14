import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/home_provider.dart';

class TodayFoods extends StatelessWidget {
  const TodayFoods({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
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
    );
  }
}

class TodayMenu extends StatelessWidget {
  const TodayMenu({
    Key? key,
    required this.id,
    required this.imageUrl,
    required this.food,
  }) : super(key: key);
  final int id;
  final String? imageUrl;

  final String food;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 137,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xffEAEAEA), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8.0),
          //   child: Image.network(
          //     'https://t1.daumcdn.net/cfile/tistory/998F383359C25DD430',
          //     // 'https://pup-review-phinf.pstatic.net/MjAyMjA1MDZfMjQ0/MDAxNjUxODI3NjIwNzM0.IVIBlJrJ3WaZO_7BDt0QmtzH1l2yeMLQpiJu6CdM5Hcg.J-ybgwfs3Lvg3GZyFcWtqDLnReL5rMpUKwazK_L8Vzgg.JPEG/upload_0e29ddeb4a1e8137ba5300de9aaea9f1.jpg',
          //     fit: BoxFit.fill,
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.only(left: 11, top: 12),
            width: 113,
            height: 113,
            decoration: BoxDecoration(
              color: Color(0xffd5d5d5),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Center(child: Text('${imageUrl}')),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'null',
                  style: TextStyle(fontSize: 9, color: Color(0xffBCBCBC)),
                ),
                Text(
                  food,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
