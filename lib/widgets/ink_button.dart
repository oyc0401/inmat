import 'package:flutter/material.dart';

/// InkWell과 Ink만 있는 기본 위젯
class InkButton extends StatelessWidget {
  const InkButton({
    Key? key,
    required this.onclick,
    required this.child,
    this.inkBorderRadius,
    this.color,
  }) : super(key: key);

  final VoidCallback onclick;
  final BorderRadius? inkBorderRadius;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      borderRadius: inkBorderRadius,
      child: Ink(
        color: color,
        child: child,
      ),
    );
  }
}


/// Material, InkWell과 Ink만 있는 위젯
class InkButtonMaterial extends StatelessWidget {
  const InkButtonMaterial({
    Key? key,
    required this.onclick,
    required this.child,
    this.inkBorderRadius,
    this.color,
  }) : super(key: key);

  final VoidCallback onclick;
  final BorderRadius? inkBorderRadius;
  final Color? color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onclick,
        borderRadius: inkBorderRadius,
        child: Ink(
          color: color,
          child: child,
        ),
      ),
    );
  }
}


/// decoration을 바꿀 수 있는 InkButtonMaterial 위젯
class InkAllButton extends StatelessWidget {
  const InkAllButton({
    Key? key,
    required this.onclick,
    required this.child,
    this.inkBorderRadius,
    this.decoration,
    this.width,
    this.height,
  }) : super(key: key);

  final VoidCallback onclick;
  final BorderRadius? inkBorderRadius;
  final BoxDecoration? decoration;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: inkBorderRadius,
      child: InkWell(
        onTap: onclick,
        borderRadius: inkBorderRadius,
        child: Ink(
          width: width,
          height: height,
          decoration: decoration,
          child: child,
        ),
      ),
    );
  }
}

/// 부모 Material 위젯을 제거함으로써 그림자기 정해진 사이즈 밖으로도 나갈 수 있도록 한다.
/// 하지만 색 있는 Container의 위에 올라가면 색 적용이 안된다.
class ElevateInkButton extends StatelessWidget {
  const ElevateInkButton({
    Key? key,
    required this.onclick,
    required this.child,
    this.inkBorderRadius,
    this.decoration,
    this.width,
    this.height,
  }) : super(key: key);

  final VoidCallback onclick;
  final BorderRadius? inkBorderRadius;
  final BoxDecoration? decoration;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      borderRadius: inkBorderRadius,
      child: Ink(
        width: width,
        height: height,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
