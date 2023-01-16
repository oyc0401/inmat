import 'package:flutter/material.dart';
import 'package:inmat/widgets/ink_button.dart';

class RankCard extends StatelessWidget {
  const RankCard(
      {Key? key, required this.rank, required this.word, required this.onclick})
      : super(key: key);

  final int rank;
  final String word;
  final VoidCallback onclick;

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
    return InkButton(
      onclick: onclick,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              '$rank',
              style: TextStyle(
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
      ),
    );
  }
}
