import 'package:flutter/material.dart';

/// Extension based responsive helpers.
/// Usage: context.width, context.height, context.wp(0.9), context.hp(0.2)
extension MediaQueryHelper on BuildContext {
  Size get _size => MediaQuery.of(this).size;

  double get width => _size.width;
  double get height => _size.height;

  /// Width percentage. e.g. context.wp(0.9) => 90% of screen width

  double wp(double percent) => _size.width * percent;

  /// Height percentage. e.g. context.hp(0.2) => 20% of screen height
  double hp(double percent) => _size.height * percent;

  EdgeInsets get safePadding => MediaQuery.of(this).padding;

  bool get isSmallPhone => _size.width < 360;
  bool get isTablet => _size.width >= 600;

  double get textScale => MediaQuery.of(this).textScaler.scale(1.0);
}
