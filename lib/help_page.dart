import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData _mq = MediaQuery.of(context);
    double _hs = _mq.size.width - _mq.padding.left - _mq.padding.right;
    double _vs = _mq.size.height - _mq.padding.top - _mq.padding.bottom;
    double _unitHeightValue = _hs * .01;
    double _multiplier = 4;

    return Scaffold(
      appBar: AppBar(
        title: const Text('How to solve'),
      ),
      body: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  child: Text(' Select a word from the list',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(' Enter the same word in the puzzle',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(height: _hs * .1,),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(' Tap on letters to match colors in puzzle',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(height: _hs * .1,),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(' ',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(
                  child: Text('X',
                    style: new TextStyle(
                      fontSize: _unitHeightValue * _multiplier,
                      color: Colors.white,
                      backgroundColor: Colors.lightGreen,
                    ),
                  ),
                ),
                Container(
                  child: Text(' letter is in the word and in correct spot',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(height: _hs * .1,),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(' ',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(
                  child: Text('X',
                    style: new TextStyle(
                      fontSize: _unitHeightValue * _multiplier,
                      color: Colors.white,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                ),
                Container(
                  child: Text(' letter is in the word but in wrong spot',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(height: _hs * .1,),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(' ',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(
                  child: Text('X',
                    style: new TextStyle(
                      fontSize: _unitHeightValue * _multiplier,
                      color: Colors.white,
                      backgroundColor: Colors.black45,
                    ),
                  ),
                ),
                Container(
                  child: Text(' letter is not in the word in any spot',
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(height: _hs * .1,),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(" Tap 'guess' to narrow choices",
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(height: _hs * .1,),
              ],
            ),
            Row(
              children: [
                Container(
                  child: Text(" Repeat!",
                      style: TextStyle(
                        fontSize: _unitHeightValue * _multiplier,
                      )),
                ),
                Container(height: _hs * .1,),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: FittedBox(
                    child: ElevatedButton(
                      onPressed: () {Navigator.pop(context);},
                      child: Text("Back"),
                    ),

                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}