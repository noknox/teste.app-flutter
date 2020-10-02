import 'package:flutter/material.dart';

class HomeItem {
  final String icon;
  final String title;
  final Widget child;

  HomeItem(
      {@required this.icon,
      @required this.title,
      @required this.child})
      : assert(icon != null),
        assert(title != null),
        assert(child != null);
}
