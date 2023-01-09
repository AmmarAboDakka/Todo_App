import 'package:flutter/material.dart';

class LathProvider extends ChangeNotifier {
  String LangugeChoose = 'en';

  void chooselanguge(String lang) {
    LangugeChoose = lang;

    notifyListeners();
  }
}
