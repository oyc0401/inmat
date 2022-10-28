import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("커뮤니티"),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Posting(
                  number: index,
                );
              }
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit), backgroundColor: Colors.grey,
        onPressed: () {
          print("edit");
        },
      ),
    );
  }
}

class Posting extends StatefulWidget {
  int number;

  Posting({required this.number});

  @override
  _PostingState createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            // width: double.infinity,
            // height: 100,
            // // color: Colors.blue,
            // // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            // child: Center(child: Text(widget.number.toString())),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Text('직성자명 : 제목 ~~~~'),
                ],
              ),
              ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  Expanded(child: Text('내용~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
                      '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
                      '~~~~~~~~~~~~~~~~~~~~~~~~~~~~'),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Center(child: Text('사진 칸')),
            ),
            // Container(
            //   child: Image.network('https://www.naver.com/'),
            // ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: Center(child: Text('좋아요 칸')),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.orange,
              child: Center(child: Text('댓글 칸')),
            ),
          ],
        ),

    );
  }
}

