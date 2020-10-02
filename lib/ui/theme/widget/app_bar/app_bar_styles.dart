import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/color_pallete.dart';

class AppBarStyles {
	static themeWith(ColorPalette palette) => AppBarTheme(
		color: palette.appBar(),
		elevation: 0,
	);
}
