import 'package:flutter/cupertino.dart' as System;
import 'package:recovery_phrase/ios/theme.dart' as Theme;
import 'package:recovery_phrase/ios/wordlist/word_list.dart';

class CupertinoApp extends System.CupertinoApp {
  CupertinoApp() : super(
      debugShowCheckedModeBanner: false,
      title: 'Recovery Phrase',
      theme: const Theme.CupertinoThemeData(),
      home: WordList()
  );
}