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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '지금 보고 있는 지역은',
              style: TextStyle(color: Colors.black, fontSize: 11.0),
            ),
            Row(
              children: [
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
            icon: Icon(
              Icons.search,
              color: Color(0xff7F7F7F),
            ),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => Search()))
              print('Search button is clicked');
            },
          ),
          IconButton(
            icon: Icon(
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
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Banner(),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  '오늘 이건 어때요?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffF25C05),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 23,
                ),
                FoodForm(),
                SizedBox(width: 10.5),
                FoodForm(),
                SizedBox(width: 10.5),
                FoodForm(),
                SizedBox(width: 10.5),
                FoodForm(),
                SizedBox(width: 10.5),
                FoodForm(),
              ],
            ),
          ),

          // FoodForm(),
          Row(
            children: [
              SizedBox(
                width: 8,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  '최근 남긴 리뷰',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffF25C05),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 158,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: 23,
                ),
                NewReviewForm(),
                SizedBox(width: 14),
                NewReviewForm(),
                SizedBox(width: 14),
                NewReviewForm(),
                SizedBox(width: 14),
                NewReviewForm(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(width: 20),
              Container(
                child: Text(
                  '평점순',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xff818181),
                      fontSize: 14),
                ),
              ), //평점순
              Icon(
                Icons.arrow_drop_down,
                color: Color(0xff818181),
              ),
              SizedBox(
                width: 150,
              ), //새로고침
              ElevatedButton.icon(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color(0xffEFEFEF),
                    )),
                onPressed: () {
                  print("새로고침");
                },
                icon: Icon(
                  Icons.refresh,
                  color: Color(0xffFF8C66),
                ),
                //icon data for elevated button
                label: Text(
                  "새로고침",
                  style: TextStyle(color: Color(0xffFF8C66)),
                ), //label text
              ),
              SizedBox(
                width: 3.8,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    '필터',
                    style: TextStyle(color: Color(0xff707070)),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Color(0xff707070)))),
                ),
              ),
              // Container(
              //   width: 60,
              //   height: 30,
              //   decoration: BoxDecoration(
              //     border: Border.all(),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Center(
              //     child: Text(
              //       '필터',
              //       style: TextStyle(color: Color(0xff707070)),
              //     ),
              //   ),
              // ), //필터
            ],
          ),
          SizedBox(
            height: 22,
          ),
          Row(
            children: [
              SizedBox(width: 25),FoodForm2(),SizedBox(width: 20),FoodForm2(),
            ],
          ), Row(
            children: [
              SizedBox(width: 25),FoodForm2(),SizedBox(width: 20),FoodForm2(),
            ],
          ), Row(
            children: [
              SizedBox(width: 25),FoodForm2(),SizedBox(width: 20),FoodForm2(),
            ],
          ), Row(
            children: [
              SizedBox(width: 25),FoodForm2(),SizedBox(width: 20),FoodForm2(),
            ],
          ), Row(
            children: [
              SizedBox(width: 25),FoodForm2(),SizedBox(width: 20),FoodForm2(),
            ],
          ),
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
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffEAEAEA), width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              'https://t1.daumcdn.net/cfile/tistory/998F383359C25DD430',
              // 'https://pup-review-phinf.pstatic.net/MjAyMjA1MDZfMjQ0/MDAxNjUxODI3NjIwNzM0.IVIBlJrJ3WaZO_7BDt0QmtzH1l2yeMLQpiJu6CdM5Hcg.J-ybgwfs3Lvg3GZyFcWtqDLnReL5rMpUKwazK_L8Vzgg.JPEG/upload_0e29ddeb4a1e8137ba5300de9aaea9f1.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    '술안주로 좋은',
                    style: TextStyle(fontSize: 11, color: Color(0xffBCBCBC)),
                  ),
                ),
                Container(
                  child: Text(
                    '음식점 이름',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          )
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
      width: 342,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: Color(0xffEAEAEA), width: 1.3),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '음식점 이름 - 인천 미추홀구',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                Text('분류:이탈리안',
                    style: TextStyle(fontSize: 14, color: Color(0xffAFAFAF))),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
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
                ),
                // Container(
                //   child: Text('브리또 피자 파스타 3개 먹었어 '),
                // ),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      color: Color(0xffFF8C66),
                    ),
                    Container(
                      child: Text(
                        '송도동 미식가',
                        style:
                            TextStyle(color: Color(0xffAFAFAF), fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ClipRRect(
          //   borderRadius: BorderRadius.circular(8.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 18),
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
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(color: Color(0xffEAEAEA), width: 3),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 80),
            width: 180, height: 180,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                  'https://t1.daumcdn.net/cfile/tistory/998F383359C25DD430'
                  // fit: BoxFit.fill
                  ),
            ),
          ),
          Container(
            child: Text(
              '인천 미추홀구',
              style: TextStyle(color: Color(0xffBCBCBC), fontSize: 11),
            ),
          ),
          Container(
            child: Text(
              '1. 미식당',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 14),
            ),
          ),
          Container(
            child: Text(
              '양식/파스타,피자',
              style: TextStyle(color: Color(0xffBCBCBC), fontSize: 11),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    '4.6',
                    style: TextStyle(
                        color: Color(0xffF25C05),
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Text(
                    '리뷰 87',
                    style: TextStyle(color: Color(0xffBCBCBC), fontSize: 11),
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

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 163,
      color: Color(0xffFF8C66),
      child: Center(
          child: Text(
        '연인과 함께하기 좋은 \n인하대 근처 레스토랑',
        style: TextStyle(
            fontSize: 21, fontWeight: FontWeight.w700, color: Colors.white),
      )),
    );
  }
}
