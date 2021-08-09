import 'package:flutter/cupertino.dart' as System;
import 'package:recovery_phrase/ios/wordlist/word_list.dart';

class CupertinoApp extends System.CupertinoApp {
  CupertinoApp() : super(
      debugShowCheckedModeBanner: false,
      title: 'Recovery Phrase',
      theme: const System.CupertinoThemeData(brightness: System.Brightness.light),
      home: WordList()
  );
}