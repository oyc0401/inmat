import 'package:flutter/material.dart';

import 'Search1.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  bool isText=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
    floatingActionButton: FloatingActionButton(child: Text("d"),onPressed: (){
      if(!isText){
        isText=true;
      }else{
        isText=false;
      }
      setState(() {

      });

    },),
      body: Column(
        children: [
          SearchScreen(),
          isText?SearchText():recommend(),
        ],
      ),

    );
  }
}

class recommend extends StatelessWidget {
  const recommend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(margin: EdgeInsets.all(10),  color: Colors.lightBlue,

            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Container(margin: EdgeInsets.all(10), child: Text('최근검색어',textAlign: TextAlign.start, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
            Container( margin: EdgeInsets.all(5), child: Text('1. 김치찌개',style: TextStyle(fontSize: 15,)),),
            Container( margin: EdgeInsets.all(5), child: Text('2. 냉면',style: TextStyle(fontSize: 15,)),),
            Container( margin: EdgeInsets.all(5), child: Text('3. 갈비탕',style: TextStyle(fontSize: 15,)),),
            Container( margin: EdgeInsets.all(5), child: Text('4. 삼겹살',style: TextStyle(fontSize: 15,)),),
            Container( margin: EdgeInsets.all(5), child: Text('5. 돈가스',style: TextStyle(fontSize: 15,)),),


          ],),),
          SizedBox(height: 20,),
          Container(margin: EdgeInsets.all(10), color: Colors.lightBlue,child: Column(children: [
            Container(margin: EdgeInsets.all(10), child: Text('인기검색어',textAlign: TextAlign.start, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
            Container(padding: EdgeInsets.all(5), margin: EdgeInsets.all(5), child: Text('1. 김치찌개',style: TextStyle(fontSize: 15,)),),
            Container(padding: EdgeInsets.all(5), margin: EdgeInsets.all(5), child: Text('2. 냉면',style: TextStyle(fontSize: 15,)),),
            Container(padding: EdgeInsets.all(5), margin: EdgeInsets.all(5), child: Text('3. 갈비탕',style: TextStyle(fontSize: 15,)),),
            Container(padding: EdgeInsets.all(5), margin: EdgeInsets.all(5), child: Text('4. 삼겹살',style: TextStyle(fontSize: 15,)),),
            Container(padding: EdgeInsets.all(5), margin: EdgeInsets.all(5), child: Text('5. 돈가스',style: TextStyle(fontSize: 15,)),),


          ],),),

        ],
      ),
    );
  }
}

class SearchText extends StatelessWidget {
  const SearchText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(margin: EdgeInsets.all(10),  color: Colors.redAccent,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Container( margin: EdgeInsets.all(5), child: Text('짬뽐',style: TextStyle(fontSize: 15,)),),
                Container( margin: EdgeInsets.all(5), child: Text('짜장면',style: TextStyle(fontSize: 15,)),),
                Container( margin: EdgeInsets.all(5), child: Text('3. 갈비탕',style: TextStyle(fontSize: 15,)),),
                Container( margin: EdgeInsets.all(5), child: Text('4. 삼겹살',style: TextStyle(fontSize: 15,)),),
                Container( margin: EdgeInsets.all(5), child: Text('5. 돈가스',style: TextStyle(fontSize: 15,)),),


              ],),),


        ],
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

