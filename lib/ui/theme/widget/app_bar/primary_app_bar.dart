import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/light_pallete.dart';

AppBar primaryAppBar(
        {title: String, List<Widget> actions, bool centerTitle = true}) =>
    AppBar(
      title: Text(title, textAlign: TextAlign.center, style: TextStyle(
          color: Colors.white
      )),
      centerTitle: centerTitle,
      actions: actions,
      iconTheme: IconThemeData(
        color: LightPalette().textPrimaryInverse(),
      ),
    );
