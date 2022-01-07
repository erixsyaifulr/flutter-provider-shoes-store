import 'package:flutter/cupertino.dart';

class PageProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentindex => _currentIndex;
  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
