import 'package:flutter/material.dart';

import 'country.dart';
import 'country_list_view.dart';

void showCountryListBottomSheet({
  @required BuildContext context,
  @required ValueChanged<Country> onSelect,
  List<String> exclude,
  List<String> countryFilter,
  bool showPhoneCode = false,
  Color backgroundColor,
}) {
  assert(context != null);
  assert(onSelect != null);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _builder(
      context,
      onSelect,
      exclude,
      countryFilter,
      showPhoneCode,
      backgroundColor,
    ),
  );
}

Widget _builder(
  BuildContext context,
  ValueChanged<Country> onSelect,
  List<String> exclude,
  List<String> countryFilter,
  bool showPhoneCode,
  Color backgroundColor,
) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = device - (statusBarHeight + (kToolbarHeight / 1.5));

  Color _backgroundColor =
      backgroundColor ?? Theme.of(context).bottomSheetTheme.backgroundColor;
  if (_backgroundColor == null) {
    if (Theme.of(context).brightness == Brightness.light) {
      _backgroundColor = Colors.white;
    } else {
      _backgroundColor = Colors.black;
    }
  }

  return Container(
    height: height,
    decoration: BoxDecoration(
      color: _backgroundColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
    ),
    child: CountryListView(
      onSelect: onSelect,
      exclude: exclude,
      countryFilter: countryFilter,
      showPhoneCode: showPhoneCode,
    ),
  );
}
