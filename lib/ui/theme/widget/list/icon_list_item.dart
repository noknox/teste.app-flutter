import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/dimens.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_text_styles.dart';

class IconListItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool hasDisabledStyle;

  const IconListItem({Key key, this.icon, this.title, this.subtitle, this.onTap, this.hasDisabledStyle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Opacity(
      opacity: onTap == null && hasDisabledStyle ? 0.5 : 1,
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.only(
            left: Dimens.spacingLarge,
            right: Dimens.spacingLarge,
            top: Dimens.spacingSmall,
            bottom: Dimens.spacingSmall),
        leading: this.icon,
        title: this.title != null ? Text(this.title, style: AppTextStyles.bodyBold(theme)) : null,
        subtitle: this.subtitle != null ? Text(this.subtitle, style: AppTextStyles.body(theme)) : null,
      ),
    );
  }
}
