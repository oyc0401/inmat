import 'package:flutter/material.dart';

class Drink extends StatefulWidget {
  const Drink({Key? key}) : super(key: key);

  @override
  State<Drink> createState() => _DrinkState();
}

class _DrinkState extends State<Drink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("술 랜덤 룰렛"),
      ),
      body: Container(),
    );
  }
}

