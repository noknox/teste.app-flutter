import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/color_pallete.dart';

class AppButtonStyles {
	static themeWith(ColorPalette palette) => ButtonThemeData(
		buttonColor: palette.primary(),
		shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
		height: 48.0,
		textTheme: ButtonTextTheme.normal,
	);
}
