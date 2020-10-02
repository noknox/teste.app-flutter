import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:teste_app_flutter/app_localization.dart';
import 'package:teste_app_flutter/core/navigation/application_route.dart';
import 'package:teste_app_flutter/feature/home/presentation/page/home_page.dart';
import 'package:teste_app_flutter/feature/placeholder/presentation/page/placeholder_page.dart';
import 'package:teste_app_flutter/ui/theme/app_theme.dart';

class Application extends StatelessWidget {
  static var routes = {
    ApplicationRoute.home: (BuildContext context) => HomePage(),
    ApplicationRoute.placeholder: (BuildContext context) => PlaceholderPage(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Noknox',
      theme: AppTheme.light,
      routes: routes,
      initialRoute: ApplicationRoute.home,
      localizationsDelegates: [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
        const Locale('en', 'US'),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        final result = supportedLocales.first;
        Intl.defaultLocale = '${result. languageCode}_${result.countryCode}';
        return result;
      },
    );
  }
}

