import 'package:flutter/cupertino.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Static  {
  static EdgeInsets mainPadding(BuildContext context) => EdgeInsets.symmetric(
      vertical: 20,
      horizontal:
          ResponsiveWrapper.of(context).isLargerThan(TABLET) ? 120 : 15);
}
