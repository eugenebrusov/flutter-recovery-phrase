
import 'package:flutter/cupertino.dart';
import 'package:recovery_phrase/ios/common/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                            color: Color(0xFF1B2540),
                            borderRadius: BorderRadius.all(Radius.circular(8.0))
                        ),
                        child: SizedBox(
                          height: 160.0,
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                              crossAxisCount: 3,
                              mainAxisSpacing: 10.0,
                              height: 32.0
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 12,
                            itemBuilder: (context, index) => _buildTileWidget(context, index),
                          ),
                        ),
                      ),
                    ),
                  ],
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

  Widget _buildTileWidget(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Text(
          '$index',
          style: Theme.CupertinoTheme.of(context).textTheme.caption1TextStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Item $index',
            style: Theme.CupertinoTheme.of(context).textTheme.title1TextStyle,
          ),
        )
      ]
    );
  }
}