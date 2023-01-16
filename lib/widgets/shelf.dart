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
    this.crossAxisAlignment,
    this.mainAxisAlignment,
    this.divideColor,
  }) : super(key: key);
  final List<Widget> children;
  final double? space;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? divideColor;

  List<Widget> get _childrenSpace {
    List<Widget> value = [];

    for (Widget child in children) {
      value.add(child);
      // 마지막이면 공백 추가 x
      if (children.last != child) {
        value.add(Container(color: divideColor, height: space));
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
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: _childrenSpace,
      ),
    );
  }
}
