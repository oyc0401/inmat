import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:inmat/src/search/providers/search_model.dart';

import 'package:inmat/widgets/shelf.dart';
import 'package:provider/provider.dart';

import '../models/rank.dart';
import '../models/recent_model.dart';
import '../widgets/rank_card.dart';
import '../widgets/recent_card.dart';

class SearchWords extends StatelessWidget {
  const SearchWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shelf(
        divideColor: const Color(0xffdedede),
        space: 8,
        children: [
          popularSection(context),
          recentSection(),
        ],
      ),
    );
  }

  Widget popularSection(BuildContext context) {
    return Shelf(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '인기검색어',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Provider.of<SearchModel>(context).successRank
            ? const SizedBox(height: 165, child: PopularWords())
            : Container(
                height: 165,
              ),
      ],
    );
  }

  Widget recentSection() {
    return const Shelf(
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      space: 0,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            '최근검색어',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        RecentWords(),
      ],
    );
  }
}

class PopularWords extends StatelessWidget {
  const PopularWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Rank> posts = Provider.of<SearchModel>(context).posts;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < 5 && i < posts.length; i++)
                RankCard(
                  onclick: () {
                    Provider.of<SearchModel>(context, listen: false)
                        .submit(posts[i].word, context);
                  },
                  rank: posts[i].rank,
                  word: posts[i].word,
                ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 5; i < 10 && i < posts.length; i++)
                RankCard(
                  onclick: () {
                    Provider.of<SearchModel>(context, listen: false)
                        .submit(posts[i].word, context);
                  },
                  rank: posts[i].rank,
                  word: posts[i].word,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class RecentWords extends StatelessWidget {
  const RecentWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<RecentModel> recents = Provider.of<SearchModel>(context).recents;
    return Column(
      children: [
        for (int i = 0; i < 20 && i < recents.length; i++)
          RecentCard(
            onclick: () {
              Provider.of<SearchModel>(context, listen: false)
                  .submit(recents[i].word, context);
            },
            onDelete: () {
              Provider.of<SearchModel>(context, listen: false)
                  .deleteRecents(recents[i].word);
            },
            word: recents[i].word,
            date: recents[i].date,
          ),
      ],
    );
  }
}
