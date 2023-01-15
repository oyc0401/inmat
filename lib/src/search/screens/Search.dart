import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'recommend_page.dart';
import '../widgets/search_input.dart';
import 'searched_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(),
      body: isText ? const SearchedPage() : RecommendPage(),
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
