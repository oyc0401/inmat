import 'package:flutter/material.dart';

/// 위젯사이의 간격을 넣어주는 Column 위젯
///
class Shelf extends StatelessWidget {
  const Shelf({
    Key? key,
    this.onclick,
    required this.children,
    this.padding,
    this.color,
    this.space = 3,
    this.border,
  }) : super(key: key);
  final VoidCallback? onclick;
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final double? space;
  final Color? color;
  final BoxBorder? border;

  EdgeInsetsGeometry get _defaultPadding => padding ?? const EdgeInsets.all(0);

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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          border: border,
        ),
        padding: _defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: _childrenSpace,
        ),
      ),
    );
  }
}
