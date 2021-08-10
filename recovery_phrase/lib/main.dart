import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:recovery_phrase/ios/cupertino_app.dart';

import 'data/source/repository.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => Repository(),
      dispose: (_, repository) => repository.dispose(),
      child: Builder(
        builder: (context) {
          return CupertinoApp();
        })
    );
  }
}
