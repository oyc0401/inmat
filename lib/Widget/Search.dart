import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search), // 장바구니 아이콘 생성
          onPressed: () {
            // 아이콘 버튼 실행
            print('Shopping cart button is clicked');
          },
        ),
      ],

          //  , title: child: TextField(),
          // Text("검색"), centerTitle: true, elevation: 0.0, leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          //     print('menu button is clicked');
          //   },
          //  ),





          ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              margin: EdgeInsets.all(50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.white),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(' 인기검색어',
                    style: TextStyle(color: Colors.black, fontSize: 50)),
              ),
            ),
            Container(
              height: 200,
              color: Colors.white,
              margin: EdgeInsets.all(50),
            ),
          ],
        ),
      ),
    );
  }
}

class textbox extends StatelessWidget {
  const textbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.blue,
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none, hintText: '검색'),
      ),
    );
  }
}

