
import 'package:flutter/cupertino.dart';
import 'package:recovery_phrase/ios/theme.dart';

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        child: Text('Write down your recovery phrase', style: CupertinoTypography.largeTitleTextStyle),
      ),
    );
  }
}