import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/color_pallete.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';


class AppTextStyles {
	/// MATERIAL DESIGN DEFAULTS:
	/// headline1               112.0  thin     0.0
	/// headline2               56.0   normal   0.0
	/// headline3               45.0   normal   0.0
	/// headline4               34.0   normal   0.0
	/// headline5               24.0   normal   0.0
	/// headline6               20.0   medium   0.0
	/// subtitle1               16.0   normal   0.0
	/// body1 (bodyText1)       14.0   medium   0.0
	/// body2 (bodyText2)       14.0   normal   0.0
	/// caption                 12.0   normal   0.0
	/// button                  14.0   medium   0.0
	/// subtitle2               14.0   medium   0.0
	/// overline                10.0   normal   0.0
	static themeWith(ColorPalette palette) => TextTheme(
		headline1 : TextStyle(fontSize: 36.0, fontWeight: FontWeight.w200, color: palette.textPrimary()),
		headline2 : TextStyle(fontSize: 56.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
		headline3 : TextStyle(fontSize: 45.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
		headline4 : TextStyle(fontSize: 34.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
		headline5 : TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: palette.textPrimary()),
		headline6 : TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
		subtitle1 : TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
		subtitle2 : TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: palette.textPrimary()),
		bodyText1 : TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: palette.textSecondary()),
		bodyText2 : TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
		caption : TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
		button : TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: palette.textPrimaryInverse()),
		overline : TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal, color: palette.textPrimary()),
	);


	static TextStyle headline(ThemeData theme) => theme.textTheme.headline1;
	static TextStyle title(ThemeData theme) => theme.textTheme.headline5;
	static TextStyle titleSmall(ThemeData theme) => theme.textTheme.headline6;
	static TextStyle subtitle(ThemeData theme) => theme.textTheme.subtitle1;
	static TextStyle subtitleBold(ThemeData theme) => theme.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold);
	static TextStyle body(ThemeData theme) => theme.textTheme.bodyText2;
	static TextStyle bodyBold(ThemeData theme) => theme.textTheme.subtitle2;
	static TextStyle subBody(ThemeData theme) => theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.normal);
	static TextStyle caption(ThemeData theme) => theme.textTheme.caption;
	static TextStyle button(ThemeData theme) => theme.textTheme.button;
	static TextStyle error(ThemeData theme) => theme.textTheme.bodyText2.copyWith(color: AppTheme.paletteOf(theme).error());
	static TextStyle inverseButton(ThemeData theme) => theme.textTheme.button.copyWith(color: AppTheme.paletteOf(theme).primary());

	AppTextStyles._();
}
