import 'package:flutter/material.dart';

class CountryListThemeData {
  /// The country bottom sheet's background color.
  ///
  /// If null, [backgroundColor] defaults to [BottomSheetThemeData.backgroundColor].
  final Color? backgroundColor;

  ///The style to use for country name text.
  ///
  /// If null, the style will be set to [TextStyle(fontSize: 16)]
  final TextStyle? textStyle;

  ///The flag size.
  ///
  /// If null, set to 25
  final double? flagSize;

  CountryListThemeData({this.backgroundColor, this.textStyle, this.flagSize});
}
