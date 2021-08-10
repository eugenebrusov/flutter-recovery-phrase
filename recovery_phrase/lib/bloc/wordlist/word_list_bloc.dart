
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:recovery_phrase/data/model/resource.dart';
import 'package:recovery_phrase/data/source/repository.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_bloc_extension.dart';
import 'package:rxdart/rxdart.dart';

class WordListBloc {
  WordListBloc({
    @required this.context,
    @required this.repository,
  }) : reloadSubject = PublishSubject(),
        wordsStream = buildWordsStream(),
        wordDataModelsStream = buildWordDataModelsStream(),
        wordsUiModelStream = buildWordsUiModelStream();

  final BuildContext context;
  final Repository repository;
  final PublishSubject<void> reloadSubject;
  final Stream<Resource<List<String>>> wordsStream;
  final Stream<Resource<List<WordDataModel>>> wordDataModelsStream;
  final Stream<WordsUiModel> wordsUiModelStream;

  void dispose() {
    reloadSubject.close();
  }

  void retry() {
    reloadSubject.add(null);
  }
}

class WordDataModel {
  WordDataModel({
    @required this.number,
    @required this.title,
  });

  final int number;
  final String title;
}

abstract class WordsUiModel {
  const WordsUiModel._();
}

class WordsSuccessUiModel extends WordsUiModel {
  const WordsSuccessUiModel({
    @required this.items,
  }): super._();

  final List<WordItemUiModel> items;
}

class WordsLoadingUiModel extends WordsUiModel {
  const WordsLoadingUiModel(): super._();
}

class WordsErrorUiModel extends WordsUiModel {
  const WordsErrorUiModel({
    @required this.errorDescription,
    @required this.retryAction,
  }): super._();

  final String errorDescription;
  final Function retryAction;
}

class WordItemUiModel {
  WordItemUiModel({
    @required this.number,
    @required this.title,
  });

  final String number;
  final String title;
}

