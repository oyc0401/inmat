import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";

  _SearchScreenState() {
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });
  }

  // widget _buildBody(BuildContext context){
  //   return StreamBuilder<QuerySnapShot>(stream: Firestore,)
  // } // 데이터를 가져와서 _buildList 호출 , snapshot future Builder 비동기처리

  // widget _buildList(BuildContext context, List<DocumnetSnapShot>)
  // // 검색결과에 따라 가져온 데이터를 처리해 GridView 생성

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(

          color: Colors.black,
          padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: TextField(
                  // // controller: controller.nicknameController,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')), // 검색창에 한글만 입력되게 하기
                  // ],
                  focusNode: focusNode,
                  style: TextStyle(fontSize: 15 , color: Colors.white),
                  autofocus: true,
                  controller: _filter,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white12,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white60,
                        size: 20,
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _filter.clear();
                                  _searchText = "";
                                });
                              },
                            )
                          : Container(),
                    hintText: '검색',
                    hintStyle: TextStyle(color: Colors.white),
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              focusNode.hasFocus ? Expanded(child: TextButton(
                child: Text('취소'),
                onPressed: (){
                  setState(() {
                    _filter.clear();
                    _searchText = "";
                    focusNode.unfocus();
                  });
                },
              ),
              )
                  :Expanded(flex: 0, child: Container(),)
            ],
          ),
        )
      ],
    );
  }
}
