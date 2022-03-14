import 'package:flutter/material.dart';
import 'wordl_widgets.dart';
import 'wordl_globals.dart';
import 'wordl_solve.dart';
import 'help_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  wordTap(row, col) {
    setState(() {
      if (types[row][col] == 'U')
        types[row][col] = 'S';
      else if (types[row][col] == 'S')
        types[row][col] = 'M';
      else if (types[row][col] == 'M')
        types[row][col] = 'W';
      else if (types[row][col] == 'W')
        types[row][col] = 'U';
      else
        types[row][col] = 'U';
    });
  }

  tapFunc() {
    setState(() {
      if(!wordEntered()) {
        showAlertDialog(context, "Error", "Please select a word from the list below\n\nCheck help for more details");
        return;
      }
      if (!typesEntered()){
        showAlertDialog(context, "Error", "You must tap each letter to match clue color given by puzzle\n\nCheck help for more details");
        return;
      }

      getPattern();
      getIncludes();
      getExcludes();
      getIgnored();
      guessWord();
      if (currentRow < 5)
        currentRow++;
      if (wordList.isEmpty)
        showAlertDialog(context, "Error", "No matching words in my dictionary.\n\nMaybe you made a mistake.\n\nPlease try again");
    });
  }

  helpFunc() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen()));
  }

  clearFunc() {
    setState(() {
      currentRow = 0;
      guessList = ["     ", "     ", "     ", "     ", "     ", "     "];
      types = [
        ['U', 'U', 'U', 'U', 'U'],
        ['U', 'U', 'U', 'U', 'U'],
        ['U', 'U', 'U', 'U', 'U'],
        ['U', 'U', 'U', 'U', 'U'],
        ['U', 'U', 'U', 'U', 'U'],
        ['U', 'U', 'U', 'U', 'U'],
      ];

      wordList.clear();
      pattern.clear();
      includes.clear();
      excludes.clear();
      ignored = [
        ['', '', '', '', ''],
        ['', '', '', '', ''],
        ['', '', '', '', ''],
        ['', '', '', '', ''],
        ['', '', '', '', ''],
      ];
    });
  }

  wordSelected(word) {
    setState(() {
      guessList[currentRow] = word;
      if (pattern.length != 5)
        types[currentRow] = ['U', 'U', 'U', 'U', 'U'];
      else {
        for (int i = 0; i < 5; i++)
          if (pattern[i] == '?')
            types[currentRow][i] = 'U';
          else
            types[currentRow][i] = 'S';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mq = MediaQuery.of(context);
    double _hs = _mq.size.width;
    double _vs = _mq.size.height - _mq.padding.top - _mq.padding.bottom;
    double _sqWidth = _hs / 5;
    double _sqHeight = _sqWidth / 2;
    double _bh = _sqHeight;
    double _bw = _sqWidth;
    double _listHeight = _vs - (_sqHeight  * 10);

    double _gap = (_hs / 5) / 3;
    _bw = _hs - (_gap * 6);
    _sqWidth = _bw / 5;
    _sqHeight = _sqWidth;
    _bh = _sqHeight;
    _bw = _sqWidth;
    _listHeight = _vs - (_sqHeight  * 10);

    if (wordList.isEmpty) {
      for (int i = 0; i < dict.length; i++) {
        wordList.add(dict[i]);
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          title: Text(widget.title),
        ),
      ),
      body:
      Column(
        children: <Widget>[
          RowGap(_bh / 5),
          GradlRow(_sqWidth, _sqHeight, 0, wordTap),
          RowGap(_bh / 5),
          GradlRow(_sqWidth, _sqHeight, 1, wordTap),
          RowGap(_bh / 5),
          GradlRow(_sqWidth, _sqHeight, 2, wordTap),
          RowGap(_bh / 5),
          GradlRow(_sqWidth, _sqHeight, 3, wordTap),
          RowGap(_bh / 5),
          GradlRow(_sqWidth, _sqHeight, 4, wordTap),
          RowGap(_bh / 5),
          GradlRow(_sqWidth, _sqHeight, 5, wordTap),
          RowGap(_bh / 5),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
//                  width: _bw * 2,
//                  height: _bh,
                  child: OpButton("Guess", tapFunc),
                ),
                Container(
//                  width: _bw * 2,
//                  height: _bh,
                  child: OpButton("Clear", clearFunc),
                ),
                Container(
//                  width: _bw * 2,
//                  height: _bh,
                  child: OpButton("Help", helpFunc),
                ),
              ]),
          RowGap(_bh / 5),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(width: _gap,),
                Container(
                  width: (_hs - (_gap * 5))/2,
                  child: Text("${wordList.length} words"),
                ),
                Container(width: _gap,),
                Container(
                  padding: EdgeInsets.all(0),
                  height: _listHeight,
                  width: (_hs - (_gap * 5))/2,
                  child: Center(
                    child: WordList(wordList, _bh, wordSelected),
                  ),
                ),
                Container(width: _gap,),
              ]),

        ],
      ),
    );
  }

  showAlertDialog(BuildContext context, String title, String message) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {Navigator.pop(context); },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}