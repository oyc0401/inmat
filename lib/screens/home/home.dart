import 'package:flutter/material.dart';

import 'banner.dart';
import 'recent_review.dart';
import 'restaurant_list.dart';
import 'today_food.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '지금 보고 있는 지역은',
              style: TextStyle(color: Colors.black, fontSize: 11.0),
            ),
            Row(
              children: const [
                Text(
                  '인하대 후문',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ],
            )
          ],
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color(0xff7F7F7F),
            ),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Search()))
              print('Search button is clicked');
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.map_outlined,
              color: Color(0xff7F7F7F),
            ),
            // 검색 아이콘 생성
            onPressed: () {
              print('Map button is clicked');
            },
          ),
        ],
      ),
      body: ListView(
        children: const [
          BannerSection(),
          Padding(
            padding: EdgeInsets.only(left: 30.0,top: 20,bottom: 7),
            child: Text(
              '오늘 이건 어때요?',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffF25C05),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TodayFood(),
          Padding(
            padding: EdgeInsets.only(left: 30.0,top: 16,bottom: 7),
            child: Text(
              '최근 남긴 리뷰',
              style: TextStyle(
                fontSize: 20,
                color: Color(0xffF25C05),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          RecentReview(),
          SizedBox(
            height: 20,
          ),
          RestaurantList(),
        ],
      ),
      // bottomNavigationBar: Container(),
    );
  }
}
