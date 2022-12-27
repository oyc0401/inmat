import 'package:flutter/material.dart';

class RandomFood extends StatefulWidget {
  const RandomFood({Key? key}) : super(key: key);

  @override
  State<RandomFood> createState() => _RandomFoodState();
}

class _RandomFoodState extends State<RandomFood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("룰렛 창"),
      ),
      body: Container(),
    );
  }
}
