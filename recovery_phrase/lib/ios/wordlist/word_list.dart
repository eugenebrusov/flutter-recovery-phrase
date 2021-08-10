
import 'package:flutter/cupertino.dart';
import 'package:recovery_phrase/ios/theme.dart' as Theme;

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 60.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  'Write down your recovery phrase',
                  style: Theme.CupertinoTheme.of(context).textTheme.largeTitleTextStyle
              ),
              Text(
                  'The 12-word recovery phrase',
                  style: Theme.CupertinoTheme.of(context).textTheme.title1TextStyle
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: CupertinoButton.filled(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Text('Confirm Backup'),
                          onPressed: () {

                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}