import 'package:flutter/material.dart';

class CommentForm extends StatelessWidget {
   CommentForm({
    Key? key,
    required this.onSubmitted,
    required this.onChanged,
  }) : super(key: key);

  final VoidCallback onSubmitted;
  final ValueChanged<String> onChanged;

  final TextEditingController _filter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      color: const Color(0xffcecece),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _filter,
              onChanged: (text) {
                onChanged(text);

              },
            ),
          ),
          IconButton(onPressed: (){
            onSubmitted();
            _filter.clear();
          }, icon: const Icon(Icons.send)),
        ],
      ),
    );
  }
}
