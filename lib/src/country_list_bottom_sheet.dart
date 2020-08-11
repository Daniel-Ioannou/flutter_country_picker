import 'package:flutter/material.dart';

import 'country.dart';
import 'country_list_view.dart';

void showCountryListBottomSheet({
  @required BuildContext context,
  @required ValueChanged<Country> onSelect,
}) {
  assert(context != null);
  assert(onSelect != null);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _builder(context, onSelect),
  );
}

Widget _builder(BuildContext context, ValueChanged<Country> onSelect) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = device - (statusBarHeight + (kToolbarHeight / 1.5));

  Color backgroundColor = Theme.of(context).bottomSheetTheme.backgroundColor;
  if (backgroundColor == null) {
    if (Theme.of(context).brightness == Brightness.light) {
      backgroundColor = Colors.white;
    } else {
      backgroundColor = Colors.black;
    }
  }

  return Container(
    height: height,
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40.0),
        topRight: Radius.circular(40.0),
      ),
    ),
    child: CountryListView(onSelect: onSelect),
  );
}
