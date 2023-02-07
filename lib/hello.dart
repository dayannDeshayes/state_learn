import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'main.dart';

@immutable
class SayHello {
  final List<WordPair> randomWord = [];

  SayHello(int num){
    for(int i = 0; i <= num; i++ ){
      randomWord.add(WordPair.random());
    }
  }
}