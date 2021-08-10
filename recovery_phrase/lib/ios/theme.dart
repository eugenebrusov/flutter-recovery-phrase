
import 'package:flutter/cupertino.dart' as System;
import 'package:flutter/cupertino.dart';

class CupertinoTheme extends System.CupertinoTheme {
  static CupertinoThemeData of(System.BuildContext context) =>
      System.CupertinoTheme.of(context) as CupertinoThemeData;
}

class CupertinoThemeData extends System.CupertinoThemeData {
  const CupertinoThemeData({
    Brightness brightness,
    Color primaryColor = _CupertinoColors.primary,
    Color primaryContrastingColor,
    CupertinoTextThemeData textTheme = _CupertinoTypography.textThemeData,
    Color barBackgroundColor,
    Color scaffoldBackgroundColor = _CupertinoColors.scaffoldBackground
  }) : super(
      brightness: brightness,
      primaryColor: primaryColor,
      primaryContrastingColor: primaryContrastingColor,
      textTheme: textTheme,
      barBackgroundColor: barBackgroundColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor);

  @override
  CupertinoTextThemeData get textTheme =>
      super.textTheme as CupertinoTextThemeData;

  @override
  CupertinoThemeData resolveFrom(BuildContext context, {bool nullOk = false}) {
    return this;
  }
}

class CupertinoTextThemeData extends System.CupertinoTextThemeData {
  const CupertinoTextThemeData({
    Color primaryColor = _CupertinoColors.onScaffoldBackground100,
    TextStyle textStyle,
    TextStyle actionTextStyle,
    TextStyle tabLabelTextStyle,
    TextStyle navTitleTextStyle,
    TextStyle navLargeTitleTextStyle,
    TextStyle navActionTextStyle,
    TextStyle pickerTextStyle,
    TextStyle dateTimePickerTextStyle,
    @required this.largeTitleTextStyle,
    @required this.title1TextStyle,
  }) : super(
      primaryColor: primaryColor,
      textStyle: textStyle,
      actionTextStyle: actionTextStyle,
      tabLabelTextStyle: tabLabelTextStyle,
      navTitleTextStyle: navTitleTextStyle,
      navLargeTitleTextStyle: navLargeTitleTextStyle,
      navActionTextStyle: navActionTextStyle,
      pickerTextStyle: pickerTextStyle,
      dateTimePickerTextStyle: dateTimePickerTextStyle);

  final TextStyle largeTitleTextStyle;
  final TextStyle title1TextStyle;
}

/// Defines text geometry
///
/// The font sizes, weights, and letter spacings in this version match the
/// [latest Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/).
class _CupertinoTypography {
  _CupertinoTypography._();

  static const TextStyle _largeTitleTextStyle = TextStyle(
    color: _CupertinoColors.onScaffoldBackground100,
    fontSize: 28,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle _title1TextStyle = TextStyle(
    color: _CupertinoColors.onScaffoldBackground100,
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const CupertinoTextThemeData textThemeData = CupertinoTextThemeData(
    largeTitleTextStyle: _largeTitleTextStyle,
    title1TextStyle: _title1TextStyle,
  );
}

class _CupertinoColors {
  _CupertinoColors._();

  static const Color primary = Color(0xFF05989A);
  static const Color scaffoldBackground = Color(0xFF0D1323);
  static const Color onScaffoldBackground100 = Color(0xFFFFFFFF);
}