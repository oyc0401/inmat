import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/src/search/providers/search_bar_model.dart';
import 'package:inmat/src/search/providers/search_model.dart';
import 'package:inmat/src/search/screens/search_result.dart';
import 'package:provider/provider.dart';

import '../domain/database/recent_search_database.dart';
import 'search_words.dart';
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
    return Scaffold(
      appBar: SearchAppBar(),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.of<SearchModel>(context).existWord
        ? const KeywordPage()
        : const SearchWords();
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
        inputController: Provider.of<SearchModel>(context).inputController,
        onChanged: (t) {
          Provider.of<SearchModel>(context, listen: false).onChanged(t);
        },
        onSubmitted: (t) {
          Provider.of<SearchModel>(context,listen: false).submit(t, context);
        },
        onClickDelete: () {
          Provider.of<SearchModel>(context, listen: false).delete();
        },
      ),
    );
  }
}
