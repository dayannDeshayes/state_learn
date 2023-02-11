
import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state/hello.dart';

part 'main.pods.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

@Riverpod()
class HelloMessager extends _$HelloMessager {
  @override
  String build() => "Hello";

  void goodbye() => state == 'Goodbye' ? state = 'Hello' : state = 'Goodbye';
}

@Riverpod()
class WordTab extends _$WordTab {
  @override
  SayHello build() => SayHello(3);

  void addBar(WordPair word) {
    final array = <WordPair>[...state.randomWord, WordPair("first", "second")];
    final cp = SayHello.copy(array);
    state = cp;
  }

  void remove(int index) {
    final array = [...state.randomWord];
    array.removeAt(index);
    final cp = SayHello.copy(array);
    state = cp;
  }
}

