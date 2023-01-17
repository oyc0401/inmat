import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key? key, required this.map, required this.onclick}) : super(key: key);
  final Map map;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onclick,
      title: Text(
        '${map}',
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
