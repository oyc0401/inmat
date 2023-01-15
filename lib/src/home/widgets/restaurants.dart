import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/src/home/domain/model/restaurant_model.dart';
import 'package:provider/provider.dart';

import '../../restaurant/info/restaurant.dart';
import '../providers/home_provider.dart';

class RestaurantList extends StatelessWidget {
  const RestaurantList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            const Text(
              '평점순',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color(0xff818181),
                  fontSize: 14),
            ), //평점순
            const Icon(
              Icons.arrow_drop_down,
              color: Color(0xff818181),
            ),
            const Spacer(),
            ElevatedButton.icon(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xffEFEFEF),
                  )),
              onPressed: () {
                print("새로고침");
              },
              icon: const Icon(
                Icons.refresh,
                color: Color(0xffFF8C66),
              ),
              //icon data for elevated button
              label: const Text(
                "새로고침",
                style: TextStyle(color: Color(0xffFF8C66)),
              ), //label text
            ),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Color(0xff707070)))),
              ),
              child: const Center(
                child: Text(
                  '필터',
                  style: TextStyle(color: Color(0xff707070)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        DoubleColumn(
          lineCount: 2,
          rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
          cutLast: true,
          children: [
            for (RestaurantModel model in Provider.of<HomeViewModel>(context).restaurants)
              RestaurantCard(
                id: model.restaurantId,
                imageUrl: model.profileImgUrl,
                restaurant: model.restaurantName,
                address: model.address,
                averageStar: model.averageStar,
                reviewCount: model.countReview,
                averagePrice: model.averagePrice,
                type: model.restaurantType,
              )
          ],
        ),
      ],
    );
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
  final int id;
  final String? imageUrl;
  final String restaurant;
  final String? address;
  final double? averageStar;
  final int? reviewCount;
  final int? averagePrice;
  final String type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          CupertinoPageRoute(
            builder: (builder) => RestaurantPage(id: id),
          ),
        );
      },
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(color: Color(0xffEAEAEA), width: 3),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 167,
            height: 167,
            decoration: BoxDecoration(
              color: Color(0xffc7c7c7),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(child: Text('$imageUrl')),
          ),
          // SizedBox(
          //   // padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
          //   width: 180, height: 180,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(8.0),
          //     child: Image.network(
          //         'https://t1.daumcdn.net/cfile/tistory/998F383359C25DD430'
          //         // fit: BoxFit.fill
          //         ),
          //   ),
          // ),
          Text(
            '$address',
            style: const TextStyle(color: Color(0xffBCBCBC), fontSize: 11),
          ),
          Text(
            restaurant,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14),
          ),
          Text(
            type,
            style: const TextStyle(color: Color(0xffBCBCBC), fontSize: 11),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '$averageStar',
                style: const TextStyle(
                    color: Color(0xffF25C05),
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              const SizedBox(width: 10),
              Text(
                '(리뷰 $reviewCount)',
                style: const TextStyle(color: Color(0xffBCBCBC), fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DoubleColumn extends StatelessWidget {
  const DoubleColumn({
    Key? key,
    required this.children,
    required this.lineCount,
    this.columnMainAxisAlignment = MainAxisAlignment.start,
    this.columnCrossAxisAlignment = CrossAxisAlignment.center,
    this.rowMainAxisAlignment = MainAxisAlignment.start,
    this.rowCrossAxisAlignment = CrossAxisAlignment.center,
    this.cutLast = false,
  }) : super(key: key);
  final List<Widget> children;
  final int lineCount;
  final bool cutLast;

  final MainAxisAlignment columnMainAxisAlignment;

  final CrossAxisAlignment columnCrossAxisAlignment;

  final MainAxisAlignment rowMainAxisAlignment;

  final CrossAxisAlignment rowCrossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    List<Widget> columnList = [];
    for (int i = 0; i < children.length; i += lineCount) {
      List<Widget> rowList = [];
      bool add = true;

      for (int k = 0; k < lineCount; k++) {
        int thisNum = i + k;
        if (thisNum >= children.length) {
          // print('stop');
          add = false;
          break;
        }
        rowList.add(children[thisNum]);
      }
      if (!(add == false && cutLast == true)) {
        columnList.add(
          Row(
            mainAxisAlignment: rowMainAxisAlignment,
            crossAxisAlignment: rowCrossAxisAlignment,
            children: rowList,
          ),
        );
      }
    }
    return Column(
      mainAxisAlignment: columnMainAxisAlignment,
      crossAxisAlignment: columnCrossAxisAlignment,
      children: columnList,
    );
  }
}

class DoubleTest extends StatelessWidget {
  const DoubleTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DoubleColumn(
        rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
        lineCount: 2,
        cutLast: true,
        children: [
          Container(
            height: 30,
            width: 100,
            color: Colors.redAccent,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.orange,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.yellowAccent,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.green,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.blue,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.indigoAccent,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.purple,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.green,
          ),
          Container(
            height: 30,
            width: 100,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
