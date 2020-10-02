import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_text_styles.dart';

class TertiaryButton extends StatelessWidget {

	final VoidCallback onPressed;
	final VoidCallback onLongPress;
	final Widget child;
	final String text;

	const TertiaryButton({Key key, @required this.onPressed, this.onLongPress, this.child, this.text}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);

		return FlatButton(
			child: this.child ?? Text(this.text, style: AppTextStyles.inverseButton(theme)),
			onPressed: onPressed,
			onLongPress: onLongPress,
		);
	}
}
