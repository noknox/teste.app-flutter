import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_app_flutter/app_localization.dart';
import 'package:teste_app_flutter/feature/home/domain/entity/home_item.dart';
import 'package:teste_app_flutter/feature/pet/presentation/page/pet_home_page.dart';
import 'package:teste_app_flutter/feature/placeholder/presentation/page/placeholder_page.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;

  final _items = [
    HomeItem(
        icon: 'assets/ic_vehicle.svg',
        title: 'menu_item_vehicles',
        child: PlaceholderPage()),
    HomeItem(
        icon: 'assets/ic_pet.svg',
        title: 'menu_item_pets',
        child: PetHomePage()),
    HomeItem(
        icon: 'assets/ic_account.svg',
        title: 'menu_icon_profile',
        child: PlaceholderPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.light;
    final palette = AppTheme.paletteOf(theme);

    return Theme(
        data: theme,
        child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: true,
                currentIndex: currentPage,
                onTap: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                showUnselectedLabels: true,
                unselectedItemColor: Colors.black54,
                items: _items
                    .map((e) => BottomNavigationBarItem(
                          icon: SvgPicture.asset(e.icon, color: palette.secondary()),
                          activeIcon: SvgPicture.asset(e.icon, color: palette.primary()),
                          title: Text(getString(context, e.title)),
                        ))
                    .toList()),
            body: _buildContent(theme)));
  }

  Widget _buildContent(ThemeData theme) {
    return _items[currentPage].child;
  }
}
