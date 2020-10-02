import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class AppLocalization {
	final Locale locale;
	Map<String, String> _localizedStrings;

	AppLocalization(this.locale);

	static const LocalizationsDelegate<AppLocalization> delegate = _AppLocalizationDelegate();

	static AppLocalization of(BuildContext context) {
		return Localizations.of(context, AppLocalization);
	}

	Future load() async {
		String fileContent = await rootBundle.loadString('lang/${locale.languageCode}_${locale.countryCode}.json');
		Map<String, dynamic> map = json.decode(fileContent);
		_localizedStrings = map.map((k, v) {
			return MapEntry(k.toString(), v.toString());
		});
	}

	String translate(String key) {
		return _localizedStrings[key];
	}

}

String getString(BuildContext context, String key) => context != null ? (AppLocalization.of(context).translate(key) ?? '') : null;

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {

	const _AppLocalizationDelegate();

	@override
	bool isSupported(Locale locale) {
		return ['pt', 'en'].contains(locale.languageCode);
	}

	@override
	Future<AppLocalization> load(Locale locale) async {
		var localizations = AppLocalization(locale);
		await localizations.load();
		return localizations;
	}

	@override
	bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;

}