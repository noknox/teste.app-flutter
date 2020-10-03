import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_app_flutter/ui/theme/colors/light_pallete.dart';

class PrimaryAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool centerTitle;

  PrimaryAppBar(
      {Key key, this.title, this.actions, this.centerTitle = true})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _PrimaryAppBarState createState() => _PrimaryAppBarState();
}

class _PrimaryAppBarState extends State<PrimaryAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title,
          textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      centerTitle: widget.centerTitle,
      actions: widget.actions,
      iconTheme: IconThemeData(
        color: LightPalette().textPrimaryInverse(),
      ),
    );
  }
}
