import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool isMobileLogin = false;
  bool isOTPMode = false;
  bool isLoading = false;

  void toggleLoginMode() {
    isMobileLogin = !isMobileLogin;
    isOTPMode = false; 
    notifyListeners();
  }

  void toggleOTPMode() {
    isOTPMode = true;
    notifyListeners();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
