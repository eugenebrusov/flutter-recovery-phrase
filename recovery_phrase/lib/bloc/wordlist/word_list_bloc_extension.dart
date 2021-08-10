
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_bloc.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_exception.dart';
import 'package:recovery_phrase/data/model/resource.dart';
import 'package:recovery_phrase/localizations/localizations.dart';
import 'package:recovery_phrase/util/parse.dart';
import 'package:rxdart/rxdart.dart';

extension WordListBlocExtension on WordListBloc {
  Stream<Resource<List<String>>> buildWordsStream() => reloadSubject
      .startWith(null)
      .switchMap((_) {
        return get('https://raw.githubusercontent.com/sideswap-io/sideswapclient/master/assets/wordlist.txt')
            .then(_parseResponse)
            .asStream()
            .map((uiModels) => Resource.success(data: uiModels))
            .startWith(Resource.loading())
            .onErrorReturnWith((error) => Resource.error(error: error));
      })
      .shareReplay(maxSize: 1);

  Future<List<String>> _parseResponse(Response response) async {
    if (response.statusCode == HttpStatus.ok) {
      return compute(parseBody, response.body);
    } else {
      throw WordListApiException(response.statusCode);
    }
  }

  Stream<Resource<List<WordDataModel>>> buildWordDataModelsStream() => wordsStream
      .switchMap<Resource<List<WordDataModel>>>((resource) {
        if (resource is Success<List<String>>) {
          return Stream.fromIterable(List.generate(resource.data.length, (index) => index)..shuffle())
              .take(12)
              .map((index) => resource.data[index])
              .toList()
              .then((words) {
                return Stream.fromIterable(words)
                    .map((word) => WordDataModel(
                      number: words.indexOf(word) + 1,
                      title: word
                    ))
                    .toList();
              })
              .asStream()
              .map((dataModels) => Resource.success(data: dataModels))
              .onErrorReturnWith((error) => Resource.error(error: error));
        } else if (resource is Error) {
          return Stream.value(Resource.error(error: (resource as Error).error));
        } else {
          return Stream.value(Resource.loading());
        }
      })
      .shareReplay(maxSize: 1);

  Stream<WordsUiModel> buildWordsUiModelStream() => wordDataModelsStream
      .asyncMap((resource) {
        if (resource is Success<List<WordDataModel>>) {
          return Stream.fromIterable(resource.data)
            .map((dataModel) => WordItemUiModel(
              number: '${dataModel.number}',
              title: dataModel.title,
            ))
            .toList()
            .then((items) => Future.value(
              WordsSuccessUiModel(
                items: items,
              )
            ));
        } else if (resource is Error) {
          return Future.value(
              WordsErrorUiModel(
                  errorDescription: AppLocalizations.unknownError,
                  retryAction: () {
                    retry();
                  }
              )
          );
        } else {
          return Future.value(WordsLoadingUiModel());
        }
      })
      .shareReplay(maxSize: 1);
}