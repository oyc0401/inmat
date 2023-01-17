import 'package:flutter/material.dart';
import 'package:inmat/widgets/shelf.dart';

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
    required this.nickName,
    required this.content,
    required this.date,
    required this.profileImgUrl,
  }) : super(key: key);

  final String nickName;
  final String content;
  final String date;
  final String? profileImgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: Shelf(children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffe1e1e1),
                  borderRadius: BorderRadius.circular(5)),
              width: 30,
              height: 30,
              child: Center(
                child: Text(
                  '$profileImgUrl',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
            ),
            SizedBox(width: 6),
            Text(
              nickName,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(
          content,
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: 14,
          ),
        ),
        SizedBox(width: 2),
        Text(
          date,
          style: TextStyle(
            color: Color(0xff888888),
            fontSize: 12,
          ),
        )
      ]),
    );
  }
}
