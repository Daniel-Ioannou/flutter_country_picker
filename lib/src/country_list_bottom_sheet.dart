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
  CustomFlagBuilder? customFlagBuilder,
  CountryListThemeData? countryListTheme,
  bool searchAutofocus = false,
  bool showWorldWide = false,
  bool showSearch = true,
  bool showDragHandle = true,
  bool useSafeArea = false,
  bool useRootNavigator = false,
  bool moveAlongWithKeyboard = false,
  Widget header = const SizedBox.shrink(),
}) {
  final ShapeBorder shape = RoundedRectangleBorder(
    borderRadius: countryListTheme?.borderRadius ??
        const BorderRadius.vertical(top: Radius.circular(24)),
  );

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: countryListTheme?.backgroundColor,
    shape: shape,
    useSafeArea: useSafeArea,
    showDragHandle: showDragHandle,
    useRootNavigator: useRootNavigator,
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
      moveAlongWithKeyboard,
      customFlagBuilder,
      header,
    ),
  ).whenComplete(() {
    if (onClosed != null) onClosed();
  });
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
  bool moveAlongWithKeyboard,
  CustomFlagBuilder? customFlagBuilder,
  Widget header,
) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = countryListTheme?.bottomSheetHeight ??
      device - (statusBarHeight + (kToolbarHeight / 1.5));
  final width = countryListTheme?.bottomSheetWidth;

  return Padding(
    padding: moveAlongWithKeyboard
        ? MediaQuery.of(context).viewInsets
        : EdgeInsets.zero,
    child: Container(
      height: height,
      width: width,
      padding: countryListTheme?.padding,
      margin: countryListTheme?.margin,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
          customFlagBuilder: customFlagBuilder,
          header: header,
        ),
      ),
    ),
  );
}
