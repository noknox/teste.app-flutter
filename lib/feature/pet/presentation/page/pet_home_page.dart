import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_app_flutter/app_localization.dart';
import 'package:teste_app_flutter/core/navigation/application_route.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';
import 'package:teste_app_flutter/ui/theme/widget/app_bar/primary_app_bar.dart';
import 'package:teste_app_flutter/ui/theme/widget/list/icon_list_item.dart';

class PetHomePage extends StatelessWidget {
  final theme = AppTheme.light;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Scaffold(
        appBar: PrimaryAppBar(title: getString(context, 'pet_area_page_title')),
        body: _buildList(context),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        IconListItem(
            icon: SvgPicture.asset('assets/ic_pet_mypets.svg', width: 36),
            title: getString(context, 'pet_area_menu_item_my_pets'),
            onTap: () {
              Navigator.of(context).pushNamed(ApplicationRoute.petList);
            }),
        Divider(),
        IconListItem(
            icon: SvgPicture.asset('assets/ic_pet_petmissing.svg', width: 36),
            title: getString(context, 'pet_area_menu_item_missing_pet')),
        Divider(),
        IconListItem(
            icon: SvgPicture.asset('assets/ic_pet_petsitter.svg', width: 36),
            title: getString(context, 'pet_area_menu_item_pet_sitter')),
        Divider(),
      ],
    );
  }
}
