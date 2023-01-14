import 'package:flutter/material.dart';
import 'package:inmat/widgets/shelf.dart';

class RecommendPage extends StatelessWidget {
  const RecommendPage({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List list;

  @override
  Widget build(BuildContext context) {
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Shelf(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '인기검색어',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              // for (Map map in list)
              // RankCard(
              //   rank: map['ranking'],
              //   word: map['word'],
              // )
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 5 && i < list.length; i++)
                          RankCard(
                            rank: list[i]['ranking'],
                            word: list[i]['word'],
                          )
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 5; i < 10 && i < list.length; i++)
                          RankCard(
                            rank: list[i]['ranking'],
                            word: list[i]['word'],
                          )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          color: Color(0xffdedede),
          height: 8,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    '최근검색어',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )),
              // for (Map map in list)
              // RankCard(
              //   rank: map['ranking'],
              //   word: map['word'],
              // )
              for (int i = 0; i < 5 && i < list.length; i++)
                RankCard(
                  rank: list[i]['ranking'],
                  word: list[i]['word'],
                )
            ],
          ),
        ),
      ],
    );
  }
}

class RankCard extends StatelessWidget {
  const RankCard({Key? key, required this.rank, required this.word})
      : super(key: key);

  final int rank;
  final String word;

  Color get _color {
    switch (rank) {
      case 1:
        return Color(0xffFFD700);
      case 2:
        return Color(0xffC0C0C0);
      case 3:
        return Color(0xffCD7F32);
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '$rank',
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: _color,
            ),
          ),
          SizedBox(width: 6),
          Text(
            word,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
    // return ListTile(
    //   leading:
    //   title:
    // );
  }
}
