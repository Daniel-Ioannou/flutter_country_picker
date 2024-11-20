import 'package:country_picker/country_picker.dart';
import 'package:country_picker/src/res/strings/he.dart';
import 'package:flutter/material.dart';

import 'res/country_codes.dart';
import 'res/strings/ar.dart';
import 'res/strings/bg.dart';
import 'res/strings/ca.dart';
import 'res/strings/cn.dart';
import 'res/strings/cs.dart';
import 'res/strings/da.dart';
import 'res/strings/de.dart';
import 'res/strings/en.dart';
import 'res/strings/es.dart';
import 'res/strings/et.dart';
import 'res/strings/fa.dart';
import 'res/strings/fr.dart';
import 'res/strings/gr.dart';
import 'res/strings/hr.dart';
import 'res/strings/ht.dart';
import 'res/strings/id.dart';
import 'res/strings/it.dart';
import 'res/strings/ja.dart';
import 'res/strings/ko.dart';
import 'res/strings/ku.dart';
import 'res/strings/lt.dart';
import 'res/strings/lv.dart';
import 'res/strings/nb.dart';
import 'res/strings/nl.dart';
import 'res/strings/nn.dart';
import 'res/strings/np.dart';
import 'res/strings/pl.dart';
import 'res/strings/pt.dart';
import 'res/strings/ro.dart';
import 'res/strings/ru.dart';
import 'res/strings/sk.dart';
import 'res/strings/tr.dart';
import 'res/strings/tw.dart';
import 'res/strings/uk.dart';

/// Used to parse simple string representations of countries, commonly used in
/// databases and other forms of storage, to a Country object.
class CountryParser {
  /// Returns a single country if [country] matches a country code or name.
  ///
  /// Throws an [ArgumentError] if no matching element is found.
  static Country parse(String country) {
    return tryParseCountryCode(country) ?? parseCountryName(country);
  }

  /// Returns a single country if [country] matches a country code or name.
  ///
  /// returns null if no matching element is found.
  static Country? tryParse(String country) {
    return tryParseCountryCode(country) ?? tryParseCountryName(country);
  }

  /// Returns a single country if it matches the given [countryCode] (iso2_cc).
  ///
  /// Throws a [StateError] if no matching element is found.
  static Country parseCountryCode(String countryCode) {
    return _getFromCode(countryCode.toUpperCase());
  }

  /// Returns a single country if it matches the given [phoneCode] (e164_cc).
  ///
  /// Throws a [StateError] if no matching element is found.
  static Country parsePhoneCode(String phoneCode) {
    return _getFromPhoneCode(phoneCode);
  }

  /// Returns a single country that matches the given [countryCode] (iso2_cc).
  ///
  /// Returns null if no matching element is found.
  static Country? tryParseCountryCode(String countryCode) {
    try {
      return parseCountryCode(countryCode);
    } catch (_) {
      return null;
    }
  }

  /// Returns a single country that matches the given [phoneCode] (e164_cc).
  ///
  /// Returns null if no matching element is found.
  static Country? tryParsePhoneCode(String phoneCode) {
    try {
      return parsePhoneCode(phoneCode);
    } catch (_) {
      return null;
    }
  }

  /// Returns a single country if it matches the given [countryName].
  ///
  /// Uses the application [context] to determine what language is used in the
  /// app, if provided, and checks the country names for this locale if any.
  /// If no match is found and no [locales] are given, the default language is
  /// checked (english), followed by the rest of the available translations. If
  /// any [locales] are given, only those supported languages are used, in
  /// addition to the [context] language.
  ///
  /// Throws an [ArgumentError] if no matching element is found.
  static Country parseCountryName(
    String countryName, {
    BuildContext? context,
    List<Locale>? locales,
  }) {
    final String countryNameLower = countryName.toLowerCase();

    final CountryLocalizations? localizations =
        context != null ? CountryLocalizations.of(context) : null;

    final String languageCode = _anyLocalizedNameToCode(
      countryNameLower,
      localizations?.locale,
      locales,
    );

    return _getFromCode(languageCode);
  }

  /// Returns a single country if it matches the given [countryName].
  ///
  /// Returns null if no matching element is found.
  static Country? tryParseCountryName(
    String countryName, {
    BuildContext? context,
    List<Locale>? locales,
  }) {
    try {
      return parseCountryName(countryName, context: context, locales: locales);
    } catch (_) {
      return null;
    }
  }

  /// Returns a country that matches the [countryCode] (e164_cc).
  static Country _getFromPhoneCode(String phoneCode) {
    return Country.from(
      json: countryCodes.singleWhere(
        (Map<String, dynamic> c) => c['e164_cc'] == phoneCode,
      ),
    );
  }

  /// Returns a country that matches the [countryCode] (iso2_cc).
  static Country _getFromCode(String countryCode) {
    return Country.from(
      json: countryCodes.singleWhere(
        (Map<String, dynamic> c) => c['iso2_cc'] == countryCode,
      ),
    );
  }

  /// Returns a country code that matches a country with the given [name] for
  /// any language, or the ones given by [locales]. If no locale list is given,
  /// the language for the [locale] is prioritized, followed by the default
  /// language, english.
  static String _anyLocalizedNameToCode(
    String name,
    Locale? locale,
    List<Locale>? locales,
  ) {
    String? code;

    if (locale != null) code = _localizedNameToCode(name, locale);
    if (code == null && locales == null) {
      code = _localizedNameToCode(name, const Locale('en'));
    }
    if (code != null) return code;

    final List<Locale> localeList = locales ?? <Locale>[];

    if (locales == null) {
      final List<Locale> exclude = <Locale>[const Locale('en')];
      if (locale != null) exclude.add(locale);
      localeList.addAll(_supportedLanguages(exclude: exclude));
    }

    return _nameToCodeFromGivenLocales(name, localeList);
  }

  /// Returns the country code that matches the given [name] for any of the
  /// [locales].
  ///
  /// Throws an [ArgumentError] if no matching element is found.
  static String _nameToCodeFromGivenLocales(String name, List<Locale> locales) {
    String? code;

    for (int i = 0; i < locales.length && code == null; i++) {
      code = _localizedNameToCode(name, locales[i]);
    }

    if (code == null) {
      throw ArgumentError.value('No country found');
    }

    return code;
  }

  /// Returns the code for the country that matches the given [name] in the
  /// language given by the [locale]. Defaults to english.
  ///
  /// Returns null if no match is found.
  static String? _localizedNameToCode(String name, Locale locale) {
    final Map<String, String> translation = _getTranslation(locale);

    String? code;

    translation.forEach((key, value) {
      if (value.toLowerCase() == name) code = key;
    });

    return code;
  }

  // ToDo: solution to prevent manual update on adding new localizations?
  /// Returns a translation for the given [locale]. Defaults to english.
  static Map<String, String> _getTranslation(Locale locale) {
    switch (locale.languageCode) {
      case 'zh':
        switch (locale.scriptCode) {
          case 'Hant':
            return tw;
          case 'Hans':
          default:
            return cn;
        }
      case 'el':
        return gr;
      case 'ar':
        return ar;
      case 'bg':
        return bg;
      case 'ku':
        return ku;
      case 'es':
        return es;
      case 'et':
        return et;
      case 'pt':
        return pt;
      case 'nb':
        return nb;
      case 'nn':
        return nn;
      case 'uk':
        return uk;
      case 'pl':
        return pl;
      case 'tr':
        return tr;
      case 'hr':
        return hr;
      case 'ht':
        return ht;
      case 'ro':
        return ro;
      case 'ru':
        return ru;
      case 'sk':
        return sk;
      case 'hi':
      case 'ne':
        return np;
      case 'fr':
        return fr;
      case 'de':
        return de;
      case 'lv':
        return lv;
      case 'lt':
        return lt;
      case 'nl':
        return nl;
      case 'it':
        return it;
      case 'ja':
        return ja;
      case 'id':
        return id;
      case 'ko':
        return ko;
      case 'cs':
        return cs;
      case 'da':
        return da;
      case 'ca':
        return ca;
      case 'he':
        return he;
      case 'fa':
        return fa;
      case 'en':
      default:
        return en;
    }
  }

  // ToDo: solution to prevent manual update on adding new localizations?
  /// A list of the supported locales, except those included in the [exclude]
  /// list.
  static List<Locale> _supportedLanguages({
    List<Locale> exclude = const <Locale>[],
  }) {
    return <Locale>[
      const Locale('en'),
      const Locale('ar'),
      const Locale('bg'),
      const Locale('ku'),
      const Locale('es'),
      const Locale('el'),
      const Locale('et'),
      const Locale('fr'),
      const Locale('nb'),
      const Locale('nn'),
      const Locale('pl'),
      const Locale('pt'),
      const Locale('ro'),
      const Locale('ru'),
      const Locale('sk'),
      const Locale('hi'),
      const Locale('ne'),
      const Locale('uk'),
      const Locale('tr'),
      const Locale('hr'),
      const Locale('ht'),
      const Locale('de'),
      const Locale('lv'),
      const Locale('lv'),
      const Locale('nl'),
      const Locale('id'),
      const Locale('ja'),
      const Locale('ko'),
      const Locale('cs'),
      const Locale('da'),
      const Locale('ca'),
      const Locale('he'),
      const Locale('fa'),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
      const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
    ]..removeWhere((Locale l) => exclude.contains(l));
  }
}
