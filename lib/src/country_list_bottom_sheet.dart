import 'package:flutter/material.dart';

import 'country.dart';
import 'country_list_theme_data.dart';
import 'country_list_view.dart';
import 'drag_config.dart';

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
  bool useSafeArea = false,
  bool useRootNavigator = false,
  bool moveAlongWithKeyboard = false,
  Widget header = const SizedBox.shrink(),
  DragConfig? config,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: config == null ? useSafeArea : true,
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
      config: config,
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
  Widget header, {
  DragConfig? config,
}) {
  final device = MediaQuery.of(context).size.height;
  final statusBarHeight = MediaQuery.of(context).padding.top;
  final height = countryListTheme?.bottomSheetHeight ??
      device - (statusBarHeight + (kToolbarHeight / 1.5));
  final width = countryListTheme?.bottomSheetWidth;

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

  Widget child({ScrollController? scrollController}) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: moveAlongWithKeyboard
            ? MediaQuery.of(context).viewInsets
            : EdgeInsets.zero,
        child: Container(
          height: height,
          width: width,
          padding: countryListTheme?.padding,
          margin: countryListTheme?.margin,
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: _borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              children: [
                header,
                Flexible(
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  if(config == null) return child();

  return DraggableScrollableSheet(
    initialChildSize: config.initialChildSize,
    minChildSize: config.minChildSize,
    maxChildSize: config.maxChildSize,
    expand: config.expand,
    snap: config.snap,
    snapSizes: config.snapSizes,
    snapAnimationDuration: config.snapAnimationDuration,
    controller: config.controller,
    builder: (context, scrollController) {
      return child(scrollController: scrollController);
    },
  );
}
