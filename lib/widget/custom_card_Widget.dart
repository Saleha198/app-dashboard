import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? borderColor;

  const CustomCardWidget({
    super.key,
    this.color,
    this.padding,
    this.borderRadius,
    this.borderColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(8.0)),
        color: color ?? Colors.white,
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(12.0),
        child: child,
      ),
    );
  }
}
