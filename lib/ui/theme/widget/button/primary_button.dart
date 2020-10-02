import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {

	final VoidCallback onPressed;
	final VoidCallback onLongPress;
	final Widget child;
	final String text;
	final Color buttonColor;

	const PrimaryButton({Key key, @required this.onPressed, this.onLongPress, this.child, this.text, this.buttonColor}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);

		return RaisedButton(
			color: AppTheme.paletteOf(theme).primary(),
			child: this.child ?? Text(this.text, style: AppTextStyles.button(theme)),
			shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
			onPressed: onPressed,
			onLongPress: onLongPress,
		);
	}
}
