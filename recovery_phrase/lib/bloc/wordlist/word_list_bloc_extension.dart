
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_bloc.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_exception.dart';
import 'package:recovery_phrase/data/model/resource.dart';
import 'package:recovery_phrase/util/parse.dart';
import 'package:rxdart/rxdart.dart';

extension WordListBlocExtension on WordListBloc {
  Stream<Resource<List<WordUiModel>>> buildUiModelsStream() => reloadSubject
      .startWith(null)
      .switchMap((_) {
        return get('https://raw.githubusercontent.com/sideswap-io/sideswapclient/master/assets/wordlist.txt')
            .then(_parseResponse)
            .then((words) {
              return Stream.fromIterable(words)
                  .map((word) => WordUiModel(number: '1', title: word))
                  .toList();
            })
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
}