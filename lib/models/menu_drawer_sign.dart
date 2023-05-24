import 'package:flutter/material.dart';

class MenuDrawerSign {
  final IconData icon;
  final String title;
  int? count;
  final Widget child;

  /// `1` left
  /// `2` right
  final int? devider;

  MenuDrawerSign({
    required this.icon,
    required this.title,
    this.count,
    this.devider,
    required this.child,
  });
}
