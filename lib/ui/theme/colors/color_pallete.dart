import 'dart:ui';

abstract class ColorPalette {
	// Core
	Color primary();
	Color primaryVariant();
	Color secondary();
	Color secondaryVariant();
	Color accent();
	Color background();
	Color backgroundDark();
	Color textPrimary();
	Color textSecondary();
	Color textTertiary();
	Color textPrimaryInverse();
	Color textSecondaryInverse();
	Color textTertiaryInverse();

	// Situational
	Color success();
	Color error();
	Color overlay();
	Color separator();

	// Components
	Color appBar();
}