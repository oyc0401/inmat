import 'package:flutter/material.dart';

class Meal extends StatefulWidget {
  const Meal({Key? key}) : super(key: key);

  @override
  State<Meal> createState() => _MealState();
}

class _MealState extends State<Meal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("밥 랜덤 룰렛"),
      ),
      body: Container(),
    );
  }
}
