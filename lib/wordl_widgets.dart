import 'package:flutter/material.dart';
import "wordl_globals.dart";

class GradlRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return(
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SmallSquare(_hs, _vs, _row, 0, _guessList[_row][0], types[_row][0], _func),
          SmallSquare(_hs, _vs, _row, 1, _guessList[_row][1], types[_row][1], _func),
          SmallSquare(_hs, _vs, _row, 2, _guessList[_row][2], types[_row][2], _func),
          SmallSquare(_hs, _vs, _row, 3, _guessList[_row][3], types[_row][3], _func),
          SmallSquare(_hs, _vs, _row, 4, _guessList[_row][4], types[_row][4], _func),
        ]));
  }

  Function _func = () {};
  double _hs = 0;
  double _vs = 0;
  int _row = 0;
  var _guessList = ["     ", "     ", "     ", "     ", "     ", "     "];


  GradlRow(hs, vs, row, func) {
    _hs = hs;
    _vs = vs;
    _func = func;
    _row = row;
    for (int i = 0; i < guessList.length; i++) {
      if (guessList[i].isNotEmpty)
        _guessList[i] = guessList[i];
    }
  }
}

class SmallSquare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _vs,
      width: _hs,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
        color: _bgcolor,
        border: Border.all(
          color: Colors.black26,
          width: 1,
        ),
      ),
      child: FittedBox(
        fit: BoxFit.contain,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            _func(_row, _col);
          },
          child: Text(
            _txt,
            style: new TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 100,
              color: _fgcolor,
            ),
          ),
        ),
      ),
    );
  }


  double _hs = 0;
  double _vs = 0;
  String _choices = '';
  int _row = 0;
  int _col = 0;
  String _type = "U";
  String _txt = "";
  Function _func = () {};
  Color _color = Colors.black38;
  Color _bgcolor = Colors.white;
  Color _fgcolor = Colors.black;

  SmallSquare(hs, vs, row, col, txt, type, func) {
    _hs = hs;
    _vs = vs;
    _txt = txt;
    _row = row;
    _col = col;
    _type = type;
    _func = func;

    if (_type == "U") {
      _fgcolor = Colors.black;
      _bgcolor = Colors.white;
    }
    else if (_type == "S") {
      _fgcolor = Colors.white;
      _bgcolor = Colors.lightGreen;
    }
    else if (_type == "M") {
      _fgcolor = Colors.white;
      _bgcolor = Colors.amber;
    } else if (_type == "W") {
      _fgcolor = Colors.white;
      _bgcolor = Colors.black45;
    } else if (_type == "E") {
      _fgcolor = Colors.white;
      _bgcolor = Colors.red;
    }
  }
}

class RowGap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _gap,
    );
  }

  double _gap = 0;

  RowGap(gap) {
    _gap = gap;
  }
}

class OpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {_func();},
      child: Text(
        _txt,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
      ),
      style: ElevatedButton.styleFrom(
        primary: _color,
      ),
    );
  }

  Function _func = () {};
  String _txt = "";
  Color _color = Colors.white10;
  OpButton(val, func) {
    _txt = val;
    _func = func;
    if (val == "Clear")
      _color = Colors.deepOrangeAccent;
    else if (val == 'Guess')
      _color = Colors.lightGreen;
    else
      _color = Colors.blue;
  }
}

class WordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.zero,
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child:  ListTile(
              onTap: () {_func(_items[index]);},
              title: Text(_items[index], textAlign: TextAlign.center,),
            ),
          );
        }
    );
  }

  List<String> _items = <String>[];
  double _height = 20;
  Function _func = () {};

  WordList(items, height, func) {
    _items = items;
    _height = height;
    _func = func;
  }
}