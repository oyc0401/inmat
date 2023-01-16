import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/widgets/ink_button.dart';
import 'package:inmat/widgets/shelf.dart';
import 'package:provider/provider.dart';

import '../providers/search_bar_model.dart';
import '../providers/search_model.dart';
import 'search_result.dart';

class KeywordPage extends StatelessWidget {
  const KeywordPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String word = Provider.of<SearchModel>(context).word;
    List keywords = [
      word,
      word + " 자동",
      word + " 자동 완성",
      "짜장면",
      "보쌈",
      "피자",
      "마라탕"
    ];

    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Shelf(
            crossAxisAlignment: CrossAxisAlignment.start,
            space: 6,
            children: [
              for (String keyword in keywords) KeywordBar(keyword: keyword),
            ],
          ),
        ),
      ],
    );
  }
}

class KeywordBar extends StatelessWidget {
  const KeywordBar({Key? key, required this.keyword}) : super(key: key);

  final String keyword;

  @override
  Widget build(BuildContext context) {
    return InkButton(
      color: Color(0xffdedede),
      onclick: () {
        // Provider.of<SearchBarModel>(context, listen: false).setWord('');
        Provider.of<SearchModel>(context, listen: false)
            .submit(keyword, context);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12),
        child: Text(
          keyword,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
