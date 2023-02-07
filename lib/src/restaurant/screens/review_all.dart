import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';

class ReviewAll extends StatefulWidget {
  const ReviewAll({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<ReviewAll> createState() => _ReviewAllState();
}

class _ReviewAllState extends State<ReviewAll> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    reviews = await InmatApi.restaurant.getReviewAll(widget.id);
    setState(() {});
  }

  List reviews = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('restaurant id: ${widget.id}'),
      ),
      body: ListView(
        children: [
          for (var map in reviews)
            ListTile(
              title: Text('${map['contents']}'),
              subtitle: Text('${map['nickName']}'),
            )
        ],
      ),
    );
  }
}
