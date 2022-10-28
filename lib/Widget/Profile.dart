import 'package:flutter/material.dart';

import 'MyFavorite.dart';
import 'MyReview.dart';
import 'MyPost.dart';
import 'Notice.dart';
//화면 이동

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        actions: <Widget>[
          IconButton(
        icon: Icon(Icons.settings),
         onPressed: () {
       },)
    ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  primary: Colors.grey
                  ),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MyFavorite()));
                  }, child: Text("내가 좋아요 누른 음식점",textAlign: TextAlign.left,),),

                // Text("내가 좋아요 누른 음식점",textAlign: TextAlign.left,),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.list),
                ElevatedButton(onPressed: () {}, child: Text("내가 쓴 리뷰",textAlign: TextAlign.left,),),

              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.article ),
                Text("내가 쓴 게시글",textAlign: TextAlign.left,),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.description),
                Text("공지사항",textAlign: TextAlign.left,),
              ],
            ),
          ),
        ],
      ),

    );
  }
}

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 150, height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
          ),Container(),Container(),Container(),
        ],
      ),
    );
  }
}
