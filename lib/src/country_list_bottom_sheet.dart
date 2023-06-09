import 'package:flutter/material.dart';

import 'country.dart';
import 'country_list_theme_data.dart';
import 'country_list_view.dart';

void showCountryListBottomSheet({
  required BuildContext context,
  required ValueChanged<Country> onSelect,
  VoidCallback? onClosed,
  List<String>? favorite,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode = false,
  CountryListThemeData? countryListTheme,
  bool searchAutofocus = false,
  bool showWorldWide = false,
  bool showSearch = true,
  bool useSafeArea = false,
  bool dialogMode = false,
}) {
  if (dialogMode) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            height: getHeight(context, countryListTheme),
            width: MediaQuery.of(context).size.width * .7,
            child: Material(
              color: Colors.transparent,
              child: _builder(
                context,
                onSelect,
                favorite,
                exclude,
                countryFilter,
                showPhoneCode,
                countryListTheme,
                searchAutofocus,
                showWorldWide,
                showSearch,
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      if (onClosed != null) onClosed();
    });
  } else {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useSafeArea: useSafeArea,
      builder: (context) => _builder(
        context,
        onSelect,
        favorite,
        exclude,
        countryFilter,
        showPhoneCode,
        countryListTheme,
        searchAutofocus,
        showWorldWide,
        showSearch,
      ),
    ).whenComplete(() {
      if (onClosed != null) onClosed();
    });
  }
}

double getHeight(BuildContext context, CountryListThemeData? countryListTheme) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = countryListTheme?.bottomSheetHeight ??
      device - (statusBarHeight + (kToolbarHeight / 1.5));
  return height;
}

Widget _builder(
  BuildContext context,
  ValueChanged<Country> onSelect,
  List<String>? favorite,
  List<String>? exclude,
  List<String>? countryFilter,
  bool showPhoneCode,
  CountryListThemeData? countryListTheme,
  bool searchAutofocus,
  bool showWorldWide,
  bool showSearch,
) {
  Color? _backgroundColor = countryListTheme?.backgroundColor ??
      Theme.of(context).bottomSheetTheme.backgroundColor;
  if (_backgroundColor == null) {
    if (Theme.of(context).brightness == Brightness.light) {
      _backgroundColor = Colors.white;
    } else {
      _backgroundColor = Colors.black;
    }
  }

  final BorderRadius _borderRadius = countryListTheme?.borderRadius ??
      const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      );

  return Container(
    height: getHeight(context, countryListTheme),
    padding: countryListTheme?.padding,
    margin: countryListTheme?.margin,
    decoration: BoxDecoration(
      color: _backgroundColor,
      borderRadius: _borderRadius,
    ),
    child: CountryListView(
      onSelect: onSelect,
      exclude: exclude,
      favorite: favorite,
      countryFilter: countryFilter,
      showPhoneCode: showPhoneCode,
      countryListTheme: countryListTheme,
      searchAutofocus: searchAutofocus,
      showWorldWide: showWorldWide,
      showSearch: showSearch,
    ),
  );
}
