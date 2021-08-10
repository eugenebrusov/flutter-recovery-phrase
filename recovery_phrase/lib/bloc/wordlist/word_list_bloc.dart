
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
        uiModelsStream = buildUiModelsStream();

  final BuildContext context;
  final Repository repository;
  final PublishSubject<void> reloadSubject;
  final Stream<Resource<List<WordUiModel>>> uiModelsStream;

  void dispose() {
    // Release all the resources if any
  }

  void retry() {
    reloadSubject.add(null);
  }
}

class WordUiModel {
  final String number;
  final String title;

  WordUiModel({
    @required this.number,
    @required this.title,
  });
}