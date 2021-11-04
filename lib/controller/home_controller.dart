import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _pageSelected = 0;
  int get pageSelected => _pageSelected;

  void setPageSelected(int indexPage) {
    _pageSelected = indexPage;
    notifyListeners();
  }

  PageController? _pageController;
  PageController get pageController => _pageController!;

  void setupPageViewController() {
    _pageController = PageController(initialPage: pageSelected);
  }
}
