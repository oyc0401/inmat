// import 'dart:html';

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
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage('assets/images/profilesample.png'),
                    fit: BoxFit.cover, ),
                    shape: BoxShape.circle
                ),
                child: Center(child: Text('사진')),
              ),
              Container(child: Text(' 닉네임'),),
              Container(width: 100, height: 80,),
              Container(child: Text(' 프로필 수정하기'),),
            ],
          ),
          Container(
            height: 1.0,
            width: 370.0,
            color: Colors.black,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (_) => MyFavorite()));
                  },
                  child: Row(
                    children: [
                      // Icon(Icons.favorite),
                      // Text("내가 좋아요 누른 음식점",textAlign: TextAlign.left,),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (_) => MyFavorite()));},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blueAccent,
                          fixedSize: const Size(370, 60),
                          backgroundColor: Colors.white70,
                          textStyle: const TextStyle(fontSize: 24),
                        ),
                        icon: Icon(Icons.favorite),
                        label: Text(
                          "내가 좋아요 누른 음식점",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(Icons.list),
                // ElevatedButton(onPressed: () {}, child: Text("내가 쓴 리뷰",textAlign: TextAlign.left,),),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MyReview()));},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                    fixedSize: const Size(370, 60),
                    backgroundColor: Colors.white70,
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  icon: Icon(Icons.list),
                  label: Text(
                    "내가 쓴 리뷰",
                    textAlign: TextAlign.left,
                  ),
                ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(Icons.article ),
                // Text("내가 쓴 게시글",textAlign: TextAlign.left,),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => MyPost()));},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                    fixedSize: const Size(370, 60),
                    backgroundColor: Colors.white70,
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  icon: Icon(Icons.article),
                  label: Text(
                    "내가 쓴 게시글",
                    textAlign: TextAlign.left,
                  ),
                ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon(Icons.description),
                // Text("공지사항",textAlign: TextAlign.left,),
                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Notice  ()));},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blueAccent,
                    fixedSize: const Size(370, 60),
                    backgroundColor: Colors.white70,
                    textStyle: const TextStyle(fontSize: 24),
                  ),
                  icon: Icon(Icons.description),
                  label: Text(
                    "공지사항",
                    textAlign: TextAlign.left,
                  ),
                ),
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
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
          ),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
