import 'package:flutter/cupertino.dart' as System;
import 'package:provider/provider.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_bloc.dart';
import 'package:recovery_phrase/data/source/repository.dart';
import 'package:recovery_phrase/ios/theme.dart' as Theme;
import 'package:recovery_phrase/ios/wordlist/word_list.dart';

class CupertinoApp extends System.CupertinoApp {
  CupertinoApp() : super(
      debugShowCheckedModeBanner: false,
      title: 'Recovery Phrase',
      theme: const Theme.CupertinoThemeData(),
      home: ProxyProvider<Repository, WordListBloc>(
        update: (context, repository, previous) =>
            WordListBloc(context: context, repository: repository),
        dispose: (context, bloc) => bloc.dispose(),
        child: WordList(),
      ),
  );
}