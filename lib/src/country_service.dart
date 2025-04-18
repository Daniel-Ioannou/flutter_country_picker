import 'package:collection/collection.dart';

import 'country.dart';
import 'res/country_codes.dart';

class CountryService {
  final List<Country> _countries;

  CountryService()
      : _countries =
            countryCodes.map((country) => Country.from(json: country)).toList();

  ///Return list with all countries
  List<Country> getAll() {
    return _countries;
  }

  ///Returns the first country that match the given code.
  Country? findByCode(String? code) {
    final uppercaseCode = code?.toUpperCase();
    return _countries
        .firstWhereOrNull((country) => country.countryCode == uppercaseCode);
  }

  ///Returns the first country that match the given name.
  Country? findByName(String? name) {
    return _countries.firstWhereOrNull((country) => country.name == name);
  }

  ///Returns the first country that match the given phone code.
  Country? findByPhoneCode(String? phoneCode) {
    return _countries
        .firstWhereOrNull((country) => country.phoneCode == phoneCode);
  }

  ///Returns a list with all the countries that match the given codes list.
  List<Country> findCountriesByCode(List<String> codes) {
    final List<String> _codes =
        codes.map((code) => code.toUpperCase()).toList();
    final List<Country> countries = [];
    for (final code in _codes) {
      final Country? country = findByCode(code);
      if (country != null) {
        countries.add(country);
      }
    }
    return countries;
  }
}
