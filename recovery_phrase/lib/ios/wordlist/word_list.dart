
import 'package:flutter/cupertino.dart';
import 'package:recovery_phrase/ios/theme.dart' as Theme;
import 'package:recovery_phrase/localizations/localizations.dart';

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 60.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: Text(
                    AppLocalizations.writePhrase,
                    style: Theme.CupertinoTheme.of(context).textTheme.largeTitleTextStyle
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 6.0, right: 6.0),
                child: Text(
                    AppLocalizations.phraseDescription,
                    style: Theme.CupertinoTheme.of(context).textTheme.title1TextStyle
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF1B2540),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                  ),
                  child: Text(
                      AppLocalizations.phraseDescription,
                      style: Theme.CupertinoTheme.of(context).textTheme.title1TextStyle
                  ),
                ),
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