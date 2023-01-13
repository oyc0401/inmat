import 'package:flutter/material.dart';
import 'package:inmat/utils/test_widget.dart';
import 'package:inmat/widgets/shelf.dart';

void main() => TestWidget.run(
  ShelfButton(
    onclick: () {},
    color: Colors.white,
    border: const Border(
      bottom: BorderSide(
        width: 1,
        color: Color(0xffc94343),
      ),
    ),
    children: [
      Container(
        color: Colors.red,
        width: 30,
        height: 20,
      ),
      Container(
        color: Colors.blueGrey,
        width: 30,
        height: 20,
      ),
      Container(
        color: Colors.red,
        width: 30,
        height: 20,
      ),
    ],
  ),
  "Shelf"
);
