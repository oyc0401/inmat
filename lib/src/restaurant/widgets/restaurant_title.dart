import 'package:flutter/material.dart';
import 'package:inmat/src/restaurant/providers/restaurant_model.dart';
import 'package:inmat/utils/inmat_colors.dart';
import 'package:provider/provider.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Provider.of<RestaurantProvider>(context).name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              Provider.of<RestaurantProvider>(context).type,
              style: const TextStyle(
                fontSize: 14,
                color: Colorss.subText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              child: Text(
                '인맛지수',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  color: Colorss.subText,
                ),
              ),
            ),
            const SizedBox(width: 22),
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xffF56637),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Text(
                '리뷰 ${Provider.of<RestaurantProvider>(context, listen: false).reviewCount}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colorss.subText,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          '${Provider.of<RestaurantProvider>(context).averageStar}',
          style: const TextStyle(
            fontSize: 16,
            color: Colorss.accentColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1.5,
          color: const Color(0xffEAEAEA),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  // iconSize: 32,
                  icon: const Icon(
                    Icons.person,
                    color: Colorss.primaryColor,
                  ),
                ),
                Text(
                    '혼잡도: ${Provider.of<RestaurantProvider>(context).complexity}'),
              ],
            ),
            Container(
              height: 28,
              width: 1,
              color: Color(0xffEAEAEA),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Provider.of<RestaurantProvider>(context, listen: false)
                        .like();
                    Provider.of<RestaurantProvider>(context, listen: false)
                        .postHeart();
                  },
                  icon: Provider.of<RestaurantProvider>(context).heart
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                        )
                      : const Icon(Icons.favorite_border),
                ),
                const Text(
                  '찜',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff464444),
                  ),
                ),
              ],
            ),
            Container(
              height: 28,
              width: 1,
              color: Color(0xffEAEAEA),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.ios_share,
                    color: Color(0xff464444),
                  ),
                ),
                Text(
                  '공유',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff464444),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}

class RestaurantTitle22 extends StatelessWidget {
  const RestaurantTitle22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "이름",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "종류",
              style: const TextStyle(
                fontSize: 14,
                color: Colorss.subText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              child: Text(
                '인맛지수',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 14,
                  color: Colorss.subText,
                ),
              ),
            ),
            const SizedBox(width: 22),
            Container(
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                color: Color(0xffF56637),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 22),
            Expanded(
              child: Text(
                '리뷰 ${3}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colorss.subText,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          '${4.3}',
          style: const TextStyle(
            fontSize: 16,
            color: Colorss.accentColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1.5,
          color: const Color(0xffEAEAEA),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  // iconSize: 32,
                  icon: const Icon(
                    Icons.person,
                    color: Colorss.primaryColor,
                  ),
                ),
                Text('혼잡도: ${2}'),
              ],
            ),
            Container(
              height: 28,
              width: 1,
              color: Color(0xffEAEAEA),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // Provider.of<RestaurantProvider>(context, listen: false)
                    //     .like();
                    // Provider.of<RestaurantProvider>(context, listen: false)
                    //     .postHeart();
                  },
                  // icon: Provider.of<RestaurantProvider>(context).heart
                  //     ? const Icon(
                  //   Icons.favorite,
                  //   color: Colors.redAccent,
                  // )
                  //     : const Icon(Icons.favorite_border),
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                  ),
                ),
                const Text(
                  '찜',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff464444),
                  ),
                ),
              ],
            ),
            Container(
              height: 28,
              width: 1,
              color: Color(0xffEAEAEA),
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.ios_share,
                    color: Color(0xff464444),
                  ),
                ),
                Text(
                  '공유',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff464444),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 13),
      ],
    );
  }
}
