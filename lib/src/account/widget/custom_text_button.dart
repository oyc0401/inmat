import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
    this.text, {
    Key? key,
    required this.onclick,
  }) : super(key: key);
  final VoidCallback onclick;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: text,
    );
  }
}
