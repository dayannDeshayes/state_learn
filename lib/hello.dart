import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'main.dart';

class SayHello {
  WordPair name = WordPair('first', 'second');
  bool like = false;
  static final List<SayHello> randomWord = [];

  SayHello(int num){
    name = WordPair.random();
    for(int i = 0; i <= num; i++ ){
      randomWord.add(WordPair.random());
    }
  }

  SayHello.copy(List<WordPair> newTab){
    randomWord.addAll(newTab);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SayHello &&
          runtimeType == other.runtimeType &&
          randomWord.length == other.randomWord.length;

  @override
  int get hashCode => randomWord.hashCode;
}