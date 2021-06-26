import 'dart:async';

import 'package:bai_1/src/models/button.dart';
import 'package:flutter/material.dart';

class HomeController {
  StreamController<List<Button>> buttons = StreamController<List<Button>>();

  addData() {
    List<Button> _buttons = [];
    _buttons.add(
      Button(
        title: 'Flutter',
      ),
    );
    _buttons.add(
      Button(
        title: 'Android',
        color: Colors.redAccent,
      ),
    );
    _buttons.add(
      Button(
        title: 'IOS',
        color: Colors.black,
      ),
    );
    _buttons.add(
      Button(
        title: 'Mobile',
        color: Colors.deepOrange,
      ),
    );
    _buttons.add(
      Button(
        title: 'C# nhu cai con cac',
        color: Colors.greenAccent,
      ),
    );
    buttons.sink.add(_buttons);
  }

  Stream<List<Button>> get getButtons => buttons.stream;
}
