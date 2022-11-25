import 'package:flutter/material.dart';
// import 'search/Search.dart';

class Realhome extends StatefulWidget {
  const Realhome({Key? key}) : super(key: key);

  @override
  State<Realhome> createState() => _RealhomeState();
}

class _RealhomeState extends State<Realhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지금 보고 있는 지역은 인하대 후문 v'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Search()))
              print('Search button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.map_outlined), // 검색 아이콘 생성
            onPressed: () {
              print('Search button is clicked');
            },
          ),
        ],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              '오늘 이건 어때요???????????????????????????????//',
              style: TextStyle(fontSize: 20, color: Color(0xffF25C05)),
            ),
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                FoodForm(),
                FoodForm(),
                FoodForm(),
              ],
            ),
          ),

          // Expanded(
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: 10,
          //     itemBuilder: (BuildContext context, int index){
          //       return Text('리스트뷰');
          //     },
          //     // scrollDirection: Axis.horizontal,
          //     // children: <Widget>[
          //     //  FoodForm()
          //     // ],
          //   ),
          // ),

          // FoodForm(),
          Container(
            child: Text(
              '최근 남긴 리뷰',
              style: TextStyle(fontSize: 20, color: Color(0xffF25C05)),
            ),
          ),
          Container(
            height: 158,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                NewReviewForm(),
                NewReviewForm(),
              ],
            ),
          ),
          // FoodForm2(),
          // FoodForm2(),
          // FoodForm2(),
        ],
      ),
      // bottomNavigationBar: Container(),
    );
  }
}

class FoodForm extends StatelessWidget {
  const FoodForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey, width: 3),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://pup-review-phinf.pstatic.net/MjAyMjA1MDZfMjQ0/MDAxNjUxODI3NjIwNzM0.IVIBlJrJ3WaZO_7BDt0QmtzH1l2yeMLQpiJu6CdM5Hcg.J-ybgwfs3Lvg3GZyFcWtqDLnReL5rMpUKwazK_L8Vzgg.JPEG/upload_0e29ddeb4a1e8137ba5300de9aaea9f1.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            child: Text(
              '술안주로 좋은',
              style: TextStyle(fontSize: 11),
            ),
          ),
          Container(
            child: Text(
              '음식점 이름',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class NewReviewForm extends StatelessWidget {
  const NewReviewForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 451,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.grey, width: 3),
      ),
      child: Row(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text('음식점 이름 - 인천 미추홀구'),
                ),
                Container(
                  child: Text('분류:이탈리안'),
                ),
                Container(
                    width: 342,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                            child: RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          strutStyle: StrutStyle(fontSize: 12.0),
                          text: TextSpan(
                              text:
                                  '브리또 피자 파스타 3개 먹었어 느끼한거 잘 못드시는 분은 비추 참고로 2시 20분까지 주문받았음 그 이후에 오면 브레이크 타임 걸려서 못 먹을 듯함',
                              style: TextStyle(
                                  color: Colors.black,
                                  height: 1.4,
                                  fontSize: 12.0,
                                  fontFamily: 'NanumSquareRegular')),
                        )),
                      ],
                    )),
                // Container(
                //   child: Text('브리또 피자 파스타 3개 먹었어 '),
                // ),
                Container(
                  child: Text('리뷰 남긴사람 닉네임'),
                ),
              ],
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8.0),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                'https://t1.daumcdn.net/cfile/tistory/998F383359C25DD430'
                // 'https://pup-review-phinf.pstatic.net/MjAyMjA1MDZfMjQ0/MDAxNjUxODI3NjIwNzM0.IVIBlJrJ3WaZO_7BDt0QmtzH1l2yeMLQpiJu6CdM5Hcg.J-ybgwfs3Lvg3GZyFcWtqDLnReL5rMpUKwazK_L8Vzgg.JPEG/upload_0e29ddeb4a1e8137ba5300de9aaea9f1.jpg',
                // fit: BoxFit.fill
              ),
            ),
          ),
          // Text(key['title']),
          // ),
          // Container(
          //   width: 150,
          //   height: 150,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     border: Border.all(color: Colors.grey, width: 3),
          //   ),
          //   child: Image.network(
          //       'https://pup-review-phinf.pstatic.net/MjAyMjA1MDZfMjQ0/MDAxNjUxODI3NjIwNzM0.IVIBlJrJ3WaZO_7BDt0QmtzH1l2yeMLQpiJu6CdM5Hcg.J-ybgwfs3Lvg3GZyFcWtqDLnReL5rMpUKwazK_L8Vzgg.JPEG/upload_0e29ddeb4a1e8137ba5300de9aaea9f1.jpg',
          //   fit: BoxFit.fill,),),
        ],
      ),
    );
  }
}

class FoodForm2 extends StatelessWidget {
  const FoodForm2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 186,
      height: 186,
      child: Column(
        children: [
          Container(
            width: 186,
            height: 186,
            child: Image.network(
              'https://pup-review-phinf.pstatic.net/MjAyMjA1MDZfMjQ0/MDAxNjUxODI3NjIwNzM0.IVIBlJrJ3WaZO_7BDt0QmtzH1l2yeMLQpiJu6CdM5Hcg.J-ybgwfs3Lvg3GZyFcWtqDLnReL5rMpUKwazK_L8Vzgg.JPEG/upload_0e29ddeb4a1e8137ba5300de9aaea9f1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            child: Text('인천미추홀구'),
          ),
          Container(
            child: Text('음식점 이름'),
          ),
          Container(
            child: Text('양식/파스타,피자'),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  child: Text('평점'),
                ),
                Container(
                  child: Text('리뷰갯수'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
