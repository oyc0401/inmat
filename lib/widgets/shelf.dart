import 'package:flutter/material.dart';
import 'package:inmat/widgets/ink_button.dart';

/// 위젯사이의 간격을 넣어주는 Column 위젯
///


class Shelf extends StatelessWidget {
  const Shelf({
    Key? key,
    required this.children,
    this.space = 3,
    this.padding,
  }) : super(key: key);
  final List<Widget> children;
  final double? space;
  final EdgeInsetsGeometry? padding;

  List<Widget> get _childrenSpace {
    List<Widget> value = [];

    for (Widget child in children) {
      value.add(child);
      // 마지막이면 공백 추가 x
      if (children.last != child) {
        value.add(SizedBox(height: space));
      }
    }
    return value;
  }

  EdgeInsetsGeometry get _defaultPadding => padding ?? const EdgeInsets.all(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _defaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: _childrenSpace,
      ),
    );
  }
}






