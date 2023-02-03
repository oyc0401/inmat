import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/utils/toast.dart';

class WriteReview extends StatefulWidget {
  WriteReview({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  String review = "";
  int star = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("리뷰 작성 id: ${widget.id}"),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (text) {
              review = text;
            },
          ),
          StarBar(
            onclick: (int value) {
              star = value;
              print(value);
            },
          ),
          CupertinoButton(
              child: Text("작성"),
              onPressed: () {
                if (1 <= star && star <= 5) {
                  InMatApi.restaurant
                      .writeReview(id: widget.id, content: review, star: star,token: InMatAuth.instance.currentUser!.token);
                } else {
                  Message.showMessage("별점을 입력해주세요");
                }
              }),
        ],
      ),
    );
  }
}

class StarBar extends StatefulWidget {
  StarBar({Key? key, required this.onclick}) : super(key: key);
  final ValueChanged<int> onclick;

  @override
  State<StarBar> createState() => _StarBarState();
}

class _StarBarState extends State<StarBar> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          Star(
            light: count >= i,
            onclick: () {
              widget.onclick(i);
              setState(() {
                count = i;
              });
            },
          ),
      ],
    );
  }
}

class Star extends StatelessWidget {
  const Star({Key? key, required this.onclick, required this.light})
      : super(key: key);
  final VoidCallback onclick;
  final bool light;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onclick,
      icon: Icon(Icons.star),
      color: light ? Colors.yellow : Colors.grey,
      iconSize: 50,
    );
  }
}
