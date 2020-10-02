import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/color_pallete.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_text_styles.dart';

class AppTexts {
	static Text headline(String text, ThemeData theme) => Text(text, style: AppTextStyles.headline(theme));
	static Text title(String text, ThemeData theme) => Text(text, style: AppTextStyles.title(theme));
	static Text titleSmall(String text, ThemeData theme) => Text(text, style: AppTextStyles.titleSmall(theme));
	static Text subtitle(String text, ThemeData theme) => Text(text, style: AppTextStyles.subtitle(theme));
	static Text subtitleBold(String text, ThemeData theme) => Text(text, style: AppTextStyles.subtitleBold(theme));
	static Text body(String text, ThemeData theme) => Text(text, style: AppTextStyles.body(theme));
	static Text bodyBold(String text, ThemeData theme) => Text(text, style: AppTextStyles.bodyBold(theme));
	static Text subBody(String text, ThemeData theme) => Text(text, style: AppTextStyles.subBody(theme));
	static Text caption(String text, ThemeData theme) => Text(text, style: AppTextStyles.caption(theme));
	static Text button(String text, ThemeData theme) => Text(text, style: AppTextStyles.button(theme));
	static Text error(String text, ThemeData theme) => Text(text, style: AppTextStyles.error(theme));
	static Text inverseButton(String text, ThemeData theme) => Text(text, style: AppTextStyles.inverseButton(theme));
}
