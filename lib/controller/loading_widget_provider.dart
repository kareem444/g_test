import 'package:flutter/material.dart';

class LoadingWidgetProvider with ChangeNotifier {
  bool showLoadingScreen = false;

  setLoading(bool val) {
    showLoadingScreen = val;
    debugPrint("loading screen is true");
    notifyListeners();
  }
}
