import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import 'recommend_page.dart';
import 'search_input.dart';
import 'searched_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    list = await InMatApi.restaurant.getSearchRank();
    setState(() {});
  }

  List list = [];

  bool isText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: isText
          ? const SearchedPage()
          : RecommendPage(
              list: list,
            ),
      floatingActionButton: FloatingActionButton(
        child: const Text("d"),
        onPressed: () {
          if (!isText) {
            isText = true;
          } else {
            isText = false;
          }
          setState(() {});
        },
      ),
    );
  }
}
