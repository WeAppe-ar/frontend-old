import 'package:flutter/material.dart';

class LoggedInStream extends ChangeNotifier {
  LoggedInStream(Stream<dynamic> stream) {
    stream.listen((event) {
      notifyListeners();
    });
  }
}
