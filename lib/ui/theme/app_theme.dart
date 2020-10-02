import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/color_pallete.dart';
import 'package:teste_app_flutter/ui/theme/widget/app_bar/app_bar_styles.dart';
import 'package:teste_app_flutter/ui/theme/widget/button/app_button_styles.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_text_styles.dart';
import 'colors/light_pallete.dart';


class AppTheme {
	static final light = _themeWithPalette(Brightness.light, LightPalette());

	static ThemeData _themeWithPalette(Brightness brightness, ColorPalette palette) => ThemeData(
		brightness: brightness,
		primaryColor: palette.primary(),
		accentColor: palette.accent(),
		scaffoldBackgroundColor: palette.background(),
		backgroundColor: palette.background(),
		buttonTheme: AppButtonStyles.themeWith(palette),
		textTheme: AppTextStyles.themeWith(palette),
		appBarTheme: AppBarStyles.themeWith(palette)
	);

	static ColorPalette paletteOf(ThemeData data) => LightPalette();

	AppTheme._();
}
