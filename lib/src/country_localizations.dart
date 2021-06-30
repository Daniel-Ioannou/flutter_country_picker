import 'package:flutter/material.dart';

import 'res/strings/cn.dart';
import 'res/strings/en.dart';
import 'res/strings/es.dart';
import 'res/strings/gr.dart';
import 'res/strings/nb.dart';
import 'res/strings/nn.dart';
import 'res/strings/np.dart';
import 'res/strings/pl.dart';
import 'res/strings/pt.dart';
import 'res/strings/ru.dart';
import 'res/strings/tw.dart';
import 'res/strings/uk.dart';

class CountryLocalizations {
  final Locale locale;

  CountryLocalizations(this.locale);

  /// The `CountryLocalizations` from the closest [Localizations] instance
  /// that encloses the given context.
  ///
  /// This method is just a convenient shorthand for:
  /// `Localizations.of<CountryLocalizations>(context, CountryLocalizations)`.
  ///
  /// References to the localized resources defined by this class are typically
  /// written in terms of this method. For example:
  ///
  /// ```dart
  /// CountryLocalizations.of(context).countryName(countryCode: country.countryCode),
  /// ```
  static CountryLocalizations? of(BuildContext context) {
    return Localizations.of<CountryLocalizations>(
      context,
      CountryLocalizations,
    );
  }

  /// A [LocalizationsDelegate] that uses [_CountryLocalizationsDelegate.load]
  /// to create an instance of this class.
  static const LocalizationsDelegate<CountryLocalizations> delegate =
      _CountryLocalizationsDelegate();

  /// The localized country name for the given country code.
  String? countryName({required String countryCode}) {
    switch (locale.languageCode) {
      case 'zh':
        switch (locale.scriptCode) {
          case 'Hant':
            return tw[countryCode];
          case 'Hans':
          default:
            return cn[countryCode];
        }
      case 'el':
        return gr[countryCode];
      case 'es':
        return es[countryCode];
      case 'pt':
        return pt[countryCode];
      case 'nb':
        return nb[countryCode];
      case 'nn':
        return nn[countryCode];
      case 'uk':
        return uk[countryCode];
      case 'pl':
        return pl[countryCode];
      case 'ru':
        return ru[countryCode];
      case 'hi':
      case 'ne':
        return np[countryCode];
      case 'en':
      default:
        return en[countryCode];
    }
  }
}

class _CountryLocalizationsDelegate
    extends LocalizationsDelegate<CountryLocalizations> {
  const _CountryLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return [
      'en',
      'zh',
      'el',
      'es',
      'pl',
      'pt',
      'nb',
      'nn',
      'ru',
      'uk',
      'hi',
      'ne',
    ].contains(locale.languageCode);
  }

  @override
  Future<CountryLocalizations> load(Locale locale) {
    final CountryLocalizations localizations = CountryLocalizations(locale);
    return Future.value(localizations);
  }

  @override
  bool shouldReload(_CountryLocalizationsDelegate old) => false;
}
