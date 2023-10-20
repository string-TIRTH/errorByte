import 'package:flutter/material.dart';

// Component that provides shadow in the design

class SpecialBoxShadow extends BoxShadow {
  SpecialBoxShadow({
    Color? color,
    double? blurRadius,
  }) : super(
          color: color ?? Color(0x1a208dfe),
          offset: const Offset(0, 0),
          blurRadius: blurRadius ?? 30,
          spreadRadius: 0,
        );
}
