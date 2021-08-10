
import 'package:flutter/widgets.dart';
import 'package:recovery_phrase/data/source/repository.dart';

class WordListBloc {
  WordListBloc({
    @required this.context,
    @required this.repository
  });

  final BuildContext context;
  final Repository repository;

  void dispose() {
    // Release all the resources if any
  }
}