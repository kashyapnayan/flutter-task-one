import 'dart:async';

class TextBloc {
  final _firstTextController = StreamController<String>();
  Stream<String> get firstTextStream => _firstTextController.stream;

  final _secondTextController = StreamController<String>();
  Stream<String> get secondTextStream => _secondTextController.stream;


  updateFirstText(String text) {
    _firstTextController.sink.add(text);
  }

  updateSecondText(String text) {
    _secondTextController.sink.add(text);
  }


  dispose() {
    _firstTextController.close();
    _secondTextController.close();
  }
}

final bloc = TextBloc();