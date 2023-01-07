import 'package:flutter/material.dart';
import 'Comment.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Post id : ${widget.id}')),
      body: ListView(children: [
        Column(
          children: [
            Container(
              color: Colors.green,
            ),

          ],
        ),
      ]),
    );
  }
}
