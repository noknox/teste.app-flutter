import 'package:flutter/material.dart';
import 'package:teste_app_flutter/app_localization.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';
import 'package:teste_app_flutter/ui/theme/widget/app_bar/primary_app_bar.dart';
import 'package:teste_app_flutter/ui/theme/widget/text/app_texts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light;
    return Theme(
        data: theme,
        child: Scaffold(
            appBar: primaryAppBar(title: getString(context, 'placeholder_page_title')),
            body: Container(
              child: AppTexts.body(getString(context, 'placeholder_page_message'), theme),
            )
        )
    );
  }
}
