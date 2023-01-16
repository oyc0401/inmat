import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/restaurant/info/restaurant.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  List list = [];
  bool complete = false;

  init() async {
    print(widget.word);
    list = await InMatApi.restaurant.getSearchResult(widget.word);
    complete = true;
    setState(() {});
    // print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.word),
      ),
      body: complete ? result() : Container(),
    );
  }

  Widget result() {
    return list.isNotEmpty
        ? Column(
            children: [
              for (var map in list)
                RestaurantSearchCard(
                  onclick: () {
                    // Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (builder) =>
                              RestaurantPage(id: map['restaurantId'])),
                    );


                  },
                  restaurantId: map['restaurantId'],
                  restaurantName: map['restaurantName'],
                )
            ],
          )
        : Center(child: Text("검색결과가 없습니다."));
  }
}

class RestaurantSearchCard extends StatelessWidget {
  const RestaurantSearchCard(
      {Key? key,
      required this.restaurantId,
      required this.restaurantName,
      required this.onclick})
      : super(key: key);

  final int restaurantId;
  final String restaurantName;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onclick,
      title: Text(restaurantName),
    );
  }
}
