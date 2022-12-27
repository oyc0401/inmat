import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main/main_model.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      child: PageView(

        children: [
          for (Map map in Provider.of<HomeModel>(context).banners)
            Banner(imageUrl: map['bannerUrl'])
        ],),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({Key? key, required this.imageUrl}) : super(key: key);
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(

      color: Color(0xffFF8C66),
      child: Center(
          child: Text(
            'imageUrl',
            // style: TextStyle(
            //     fontSize: 21, fontWeight: FontWeight.w700, color: Colors.white),
          )),
    );
  }
}
