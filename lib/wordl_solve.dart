import 'wordl_globals.dart';

bool checkIgnored(String word) {
  for(int k = 0; k < ignored.length; k++) {
    for(int i = 0; i < ignored[k].length; i++) {
      if(ignored[k][i] == '?') {
        continue;
      }
      else if (ignored[k][i] == word[i]) {
        return true;
      }
    }
  }
  return false;
}

bool matchWord(String word) {

  for (int i = 0; i < word.length; i++) {
    if (word[i] == pattern[i]) {
      continue;
    } else if (pattern[i] != '?') {
      return false;
    }

    if (excludes.contains(word[i])) {
      return false;
    }

    for (int j = 0; j < includes.length; j++)
      if (word.contains(includes[j])) {
        continue;
      }
      else {
        return false;
      }
  }
  return true;
}

guessWord() {
  wordList.clear();
  for (int n = 0; n < dict.length; n++) {
    if (checkIgnored(dict[n]))
      continue;
    if (matchWord(dict[n])) {
      wordList.add(dict[n]);
    }
  }
}

getPattern() {
  pattern.clear();
  for (int i = 0; i < 5; i++) {
    if (types[currentRow][i] == 'S')
      pattern.add(guessList[currentRow][i]);
    else
      pattern.add('?');
  }
}

getIncludes() {
  includes.clear();
  for (int i = 0; i < 5; i++) {
    if (types[currentRow][i] == 'S' || types[currentRow][i] == 'M')
      if (!includes.contains(guessList[currentRow][i]))
        includes.add(guessList[currentRow][i]);
  }
}

getExcludes() {
  excludes.clear();
  for (int i = 0; i <= currentRow; i++) {
    for (int j = 0; j < 5; j++)
      if (types[i][j] == 'W')
        if(!excludes.contains(guessList[i][j]) && !includes.contains(guessList[i][j]))
          excludes.add(guessList[i][j]);
  }
}

getIgnored() {
  for (int i = 0; i < 5; i++) {
    for (int j = 0; j < 5; j++) {
      if (types[i][j] == 'M' || types[i][j] == 'W')
        ignored[i][j] = guessList[i][j];
      else
        ignored[i][j] = '?';
    }
  }
}

bool wordEntered() {
  for (int i = 0; i < 5; i++) {
    if (guessList[currentRow][i] == ' ')
      return false;
  }
  return true;
}

bool typesEntered() {
  for (int i = 0; i < 5; i++) {
    if (types[currentRow][i] == 'U')
      return false;
  }
  return true;
}