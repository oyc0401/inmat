import 'package:flutter/material.dart';
import 'package:inmat/utils/inmat_colors.dart';

import 'package:provider/provider.dart';

import '../model/banner_model.dart';
import '../widgets/banner.dart';
import '../providers/home_view_model.dart';

import '../widgets/recent_review.dart';
import '../widgets/restaurants.dart';
import '../widgets/today_food.dart';

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
        children: [
          Column(
            children: [
              bannerSection(),
              todaySection(),
              recentSection(),
              SizedBox(
                height: 20,
              ),
              RestaurantList(),
            ],
          )
        ],
      ),
      // bottomNavigationBar: Container(),
    );
  }

  Widget bannerSection() {
    return SizedBox(
      height: 163,
      child: PageView(
        children: [
          for (BannerModel model in Provider.of<HomeViewModel>(context).banners)
            RestaurantBanner(imageUrl: model.bannerUrl)
        ],
      ),
    );
  }

  Widget todaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 24, top: 18, bottom: 8),
          child: Text(
            '오늘 이건 어때요?',
            style: TextStyle(
              fontSize: 19,
              color: Colorss.accentColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TodayFoods(),
      ],
    );
  }

  Widget recentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.only(left: 24, top: 18, bottom: 8),
          child: Text(
            '최근 남긴 리뷰',
            style: TextStyle(
              fontSize: 19,
              color: Colorss.accentColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        RecentReview(),
      ],
    );
  }
}
