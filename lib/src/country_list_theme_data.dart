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

  ///The style to use for search box text.
  ///
  /// If null, the style will be set to [TextStyle(fontSize: 16)]
  final TextStyle? searchTextStyle;

  ///The flag size.
  ///
  /// If null, set to 25
  final double? flagSize;

  ///Custom emoji font family fallback for flags icons
  final List<String>? emojiFontFamilyFallback;

  ///The decoration used for the search field
  ///
  /// It defaults to a basic outline-bordered input decoration
  final InputDecoration? inputDecoration;

  ///The border radius of the bottom sheet
  ///
  /// It defaults to 40 for the top-left and top-right values.
  final BorderRadius? borderRadius;

  ///Country list modal height
  ///
  /// By default it's fullscreen
  final double? bottomSheetHeight;

  ///Country list modal Width
  ///
  /// By default it's fullscreen
  final double? bottomSheetWidth;

  /// the padding of the bottom sheet
  final EdgeInsets? padding;

  /// the margin of the bottom sheet
  final EdgeInsets? margin;

  const CountryListThemeData({
    this.backgroundColor,
    this.textStyle,
    this.searchTextStyle,
    this.flagSize,
    this.inputDecoration,
    this.borderRadius,
    this.bottomSheetHeight,
    this.bottomSheetWidth,
    this.padding,
    this.margin,
    this.emojiFontFamilyFallback,
  });
}
