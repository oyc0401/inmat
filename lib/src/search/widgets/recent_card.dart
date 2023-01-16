import 'package:flutter/material.dart';

class RecentCard extends StatelessWidget {
  const RecentCard(
      {Key? key,
      required this.word,
      required this.date,
      required this.onclick,
      required this.onDelete})
      : super(key: key);

  final String word;
  final String date;
  final VoidCallback onclick;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onclick,
      title: Text(
        '$word',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      subtitle: Text(
        date,
        style: const TextStyle(
          fontSize: 12,
        ),
      ),
      trailing: IconButton(
        onPressed: onDelete,
        icon: Icon(Icons.delete),
      ),
    );
  }
}
