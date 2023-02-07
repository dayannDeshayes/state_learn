
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
  List<String> build() => ['bonjour','au revoir','demain','aujourd\'hui'];

  void addBar(String word) {
    state = [...state, word];
  }

  void remove(int index){
     state.removeAt(index);
    state = state.toList();
  }
}

