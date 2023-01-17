import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
  const CommentForm({
    Key? key,
    required this.onSubmitted,
    required this.onChanged,
  }) : super(key: key);

  final VoidCallback onSubmitted;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      color: const Color(0xffcecece),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
            ),
          ),
          IconButton(onPressed: onSubmitted, icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
