import 'package:flutter/foundation.dart';
import 'package:g_test/model/user_model.dart';

class AuthProvider with ChangeNotifier {
  UserModel? auth;

  setAuth(UserModel? auth) {
    this.auth = auth;
    notifyListeners();
  }
}
