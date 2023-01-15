import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(word),
      ),
      body: Container(),
    );
  }
}
