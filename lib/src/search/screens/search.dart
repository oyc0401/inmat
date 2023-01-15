import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/src/search/models/search_bar_model.dart';
import 'package:inmat/src/search/screens/search_result.dart';
import 'package:provider/provider.dart';

import 'recent_word.dart';
import '../widgets/search_input.dart';
import 'keyword_page.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchBarModel>(
      create: (context) => SearchBarModel(),
      child: Scaffold(
        appBar: SearchAppBar(),
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<SearchBarModel>(context).isText
        ? const KeywordPage()
        : const RecentWord();
  }
}

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: SearchInput(
        onChanged: (t) {
          Provider.of<SearchBarModel>(context, listen: false).setWord(t);
          print(t);
        },
        onSubmitted: (t) async {
          String word =
              Provider.of<SearchBarModel>(context, listen: false).word;
          Provider.of<SearchBarModel>(context, listen: false).setWord('');
          await Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (context) => SearchResult(word: word)));
        },
      ),
    );
  }
}
