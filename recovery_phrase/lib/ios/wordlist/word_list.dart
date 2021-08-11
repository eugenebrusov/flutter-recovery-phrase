
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recovery_phrase/bloc/wordlist/word_list_bloc.dart';
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
                      child: StreamBuilder<WordsUiModel>(
                        stream: Provider.of<WordListBloc>(context, listen: false).wordsUiModelStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final WordsUiModel uiModel = snapshot.data;
                            if (uiModel is WordsSuccessUiModel) {
                              return _buildWordsListSuccess(context, uiModel);
                            } else if (uiModel is WordsErrorUiModel) {
                              return _buildWordsListError(context, uiModel);
                            }
                          }
                          return _buildWordsListLoading(context);
                        },
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
                        child: StreamBuilder<ConfirmButtonUiModel>(
                          stream: Provider.of<WordListBloc>(context, listen: false).confirmButtonUiModelStream,
                          builder: (context, snapshot) {
                            return CupertinoButton.filled(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Text(snapshot.hasData ? snapshot.data.title : ''),
                              onPressed: snapshot.hasData ? snapshot.data.action : null,
                            );
                          }
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

  Widget _buildWordsListSuccess(BuildContext context, WordsSuccessUiModel uiModel) {
    return Container(
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
          itemCount: uiModel.items.length,
          itemBuilder: (context, index) => _buildTile(context, uiModel.items[index]),
        ),
      ),
    );
  }

  Widget _buildWordsListLoading(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        animating: true,
        radius: 20.0,
      ),
    );
  }

  Widget _buildWordsListError(BuildContext context, WordsErrorUiModel uiModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
            uiModel.errorDescription,
            textAlign: TextAlign.center,
            style: Theme.CupertinoTheme.of(context).textTheme.title1TextStyle
        ),
        CupertinoButton(
          child: Text(AppLocalizations.retry),
          onPressed: () {
            uiModel.retryAction();
          },
        )
      ],
    );
  }

  Widget _buildTile(BuildContext context, WordItemUiModel uiModel) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 24.0,
          child: Text(
            '${uiModel.number}',
            style: Theme.CupertinoTheme.of(context).textTheme.caption1TextStyle,
          ),
        ),
        Text(
          '${uiModel.title}',
          style: Theme.CupertinoTheme.of(context).textTheme.title1TextStyle,
        )
      ]
    );
  }
}