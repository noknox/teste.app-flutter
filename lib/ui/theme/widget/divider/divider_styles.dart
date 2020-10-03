import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/color_pallete.dart';

class DividerStyles {
  static themeWith(ColorPalette palette) =>
      DividerThemeData(color: palette.separator(), space: 1);
}
