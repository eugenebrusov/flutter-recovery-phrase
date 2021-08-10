
import 'package:flutter/cupertino.dart' as System;
import 'package:flutter/cupertino.dart';

class CupertinoThemeData extends System.CupertinoThemeData {
  const CupertinoThemeData({
    Brightness brightness,
    Color primaryColor,
    Color primaryContrastingColor,
    CupertinoTextThemeData textTheme = const CupertinoTextThemeData(),
    Color barBackgroundColor,
    Color scaffoldBackgroundColor = _CupertinoColors.onScaffoldBackground100
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
    Color primaryColor = _CupertinoColors.scaffoldBackground,
    TextStyle textStyle,
    TextStyle actionTextStyle,
    TextStyle tabLabelTextStyle,
    TextStyle navTitleTextStyle,
    TextStyle navLargeTitleTextStyle,
    TextStyle navActionTextStyle,
    TextStyle pickerTextStyle,
    TextStyle dateTimePickerTextStyle
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
}

/// Defines text geometry
///
/// The font sizes, weights, and letter spacings in this version match the
/// [latest Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/).
class CupertinoTypography {
  CupertinoTypography._();

  static const TextStyle largeTitleTextStyle = TextStyle(
    color: _CupertinoColors.onScaffoldBackground100,
    fontSize: 28,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static const CupertinoTextThemeData iOS13 = CupertinoTextThemeData();
}

class _CupertinoColors {
  _CupertinoColors._();

  static const Color scaffoldBackground = Color(0x0D1323FF);

  static const Color onScaffoldBackground100 = Color(0xFFFFFFFF);
}