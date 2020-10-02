import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {

	final VoidCallback onPressed;
	final VoidCallback onLongPress;
	final Widget child;
	final String text;
	final Color buttonBorderColor;

	const SecondaryButton({Key key, @required this.onPressed, this.onLongPress, this.child, this.text, this.buttonBorderColor}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);

		return OutlineButton(
			child: this.child ?? Text(this.text, style: AppTextStyles.button(theme).copyWith(color: this.buttonBorderColor ?? AppTheme.paletteOf(theme).textPrimary())),
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
			borderSide: BorderSide(width: 1, color: buttonBorderColor ?? AppTheme.paletteOf(theme).primary()),
			highlightedBorderColor: AppTheme.paletteOf(theme).primaryVariant(),
			onPressed: onPressed,
			onLongPress: onLongPress,
		);
	}
}
