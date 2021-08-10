
import 'package:recovery_phrase/bloc/wordlist/word_list_bloc.dart';
import 'package:recovery_phrase/data/model/resource.dart';
import 'package:rxdart/rxdart.dart';

extension WordListBlocExtension on WordListBloc {
  Stream<Resource<List<WordUiModel>>> buildUiModelsStream() => reloadSubject
      .startWith(null)
      .switchMap((_) {
        return Future.delayed(Duration(microseconds: 2000))
            .asStream()
            .map((productCategoryUiModels) => Resource.success(data: List<WordUiModel>()))
            .startWith(Resource.loading())
            .onErrorReturnWith((error) => Resource.error(error: error));
  })
      .shareReplay(maxSize: 1);
}