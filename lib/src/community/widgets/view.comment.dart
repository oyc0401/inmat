import 'package:flutter/material.dart';
import 'package:inmat/utils/inmat_colors.dart';
import 'package:inmat/widgets/shelf.dart';

class Comment extends StatelessWidget {
  const Comment({
    Key? key,
    required this.nickName,
    required this.content,
    required this.date,
    required this.profileImgUrl,
    required this.isDadatgle,
  }) : super(key: key);

  final String nickName;
  final String content;
  final String date;
  final String? profileImgUrl;
  final bool isDadatgle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: Container(
        color: isDadatgle ? Colors.red : Colors.white,
        child: Shelf(children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colorss.skeleton,
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
      ),
    );
  }
}
