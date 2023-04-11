import 'package:flutter/material.dart';

class CommonProviders with ChangeNotifier {
  bool isLoadin = false;
  // true => loading
  // false => not loading

  void loding(bool event) {
    isLoadin = event;
    ChangeNotifier();
  }
  
}
