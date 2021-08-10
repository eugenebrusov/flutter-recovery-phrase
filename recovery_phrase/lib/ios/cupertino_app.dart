
import 'package:flutter/cupertino.dart' as System;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_bloc.dart';
import 'package:recovery_phrase/ios/theme.dart' as Theme;
import 'package:recovery_phrase/ios/wordlist/word_list.dart';
import 'package:recovery_phrase/localizations/localizations.dart';

class CupertinoApp extends System.CupertinoApp {
  CupertinoApp() : super(
      debugShowCheckedModeBanner: false,
      title: AppLocalizations.title,
      theme: const Theme.CupertinoThemeData(),
      home: Provider<WordListBloc>(
        create: (context) => WordListBloc(context: context),
        dispose: (_, bloc) => bloc.dispose(),
        child: Builder(builder: (context) {
          return WordList();
        })
      ),
  );
}