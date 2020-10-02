import 'dart:ui';

import 'package:teste_app_flutter/ui/theme/colors/color_pallete.dart';

class LightPalette implements ColorPalette {

	static final LightPalette _instance = LightPalette._internal();

	factory LightPalette() {
		return _instance;
	}

	LightPalette._internal();

	// Core
	@override Color primary() => Color(0xFF00B7BD);
	@override Color primaryVariant() => Color(0xFF06A1A4);
	@override Color secondary() => Color(0xFF666666);
	@override Color secondaryVariant() => Color(0xFF555555);
	@override Color accent() => Color(0xFFF0FF0F);
	@override Color background() => Color(0xFFFFFFFF);
	@override Color backgroundDark() => Color(0xFFF7F7F9);
	@override Color textPrimary() => Color(0xFF555555);
	@override Color textSecondary() => Color(0xFF666666);
	@override Color textTertiary() => Color(0xFF888888);
	@override Color textPrimaryInverse() => Color(0xFFFFFFFF);
	@override Color textSecondaryInverse() => Color(0x89FFFFFF);
	@override Color textTertiaryInverse() => Color(0x44FFFFFF);

	// Situational
	@override Color success() => Color(0xFF00A106);
	@override Color error() => Color(0xFFEE0066);
	@override Color overlay() => Color(0x89000000);
	@override Color separator() => Color(0xFFEEEEEE);

	// Components
	@override Color appBar() => primary();
}