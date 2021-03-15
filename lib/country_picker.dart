library country_picker;

import 'package:flutter/material.dart';

import 'src/country.dart';
import 'src/country_list_bottom_sheet.dart';
import 'src/country_list_theme_data.dart';

export 'src/country.dart';
export 'src/country_list_theme_data.dart';
export 'src/country_localizations.dart';

/// Shows a bottom sheet containing a list of countries to select one.
///
/// The callback function [onSelect] call when the user select a country.
/// The function called with parameter the country that the user has selected.
/// If the user cancels the bottom sheet, the function is not call.
///
/// An optional [exclude] argument can be used to exclude(remove) one ore more
/// country from the countries list. It takes a list of country code(iso2).
///
/// An optional [showPhoneCode] argument can be used to show phone code.
///
///  A theme for customizing the backgroundColor, text style.
///
/// The `context` argument is used to look up the [Scaffold] for the bottom
/// sheet. It is only used when the method is called. Its corresponding widget
/// can be safely removed from the tree before the bottom sheet is closed.
void showCountryPicker({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode = false,
  CountryListThemeData? countryListTheme,
}) {
  assert(exclude == null || countryFilter == null,
      'Cannot provide both exclude and countryFilter');
  showCountryListBottomSheet(
    context: context,
    onSelect: onSelect,
    exclude: exclude,
    countryFilter: countryFilter,
    showPhoneCode: showPhoneCode,
    countryListTheme: countryListTheme,
  );
}
