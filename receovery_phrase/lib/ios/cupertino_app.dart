import 'package:flutter/cupertino.dart' as System;

class CupertinoApp extends System.CupertinoApp {
  CupertinoApp() : super(
    debugShowCheckedModeBanner: false,
    title: 'Ebda iOS App',
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [
      const Locale('en', ''),
      const Locale('ar', ''),
    ],
    theme: Themes.CupertinoThemeData(),
    onGenerateRoute: _buildAppRouteFactory(),
  );
}