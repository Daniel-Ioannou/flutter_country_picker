library country_picker;

import 'package:flutter/material.dart';

import 'src/country.dart';
import 'src/country_list_bottom_sheet.dart';

export 'src/country.dart';

void showCountryPicker({
  @required BuildContext context,
  @required ValueChanged<Country> onSelect,
}) {
  assert(context != null);
  assert(onSelect != null);
  showCountryListBottomSheet(context: context, onSelect: onSelect);
}
