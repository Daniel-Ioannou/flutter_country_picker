import 'package:flutter/material.dart';

import 'res/strings/cn.dart';
import 'res/strings/en.dart';
import 'res/strings/gr.dart';
import 'res/strings/tw.dart';

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
  static CountryLocalizations of(BuildContext context) {
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
  String countryName({String countryCode}) {
    switch (locale.languageCode) {
      case 'zh':
        switch (locale.scriptCode) {
          case 'Hant':
            return tw[countryCode];
          case 'Hans':
          default:
            return cn[countryCode];
        }
        break;
      case 'el':
        return gr[countryCode];
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
