import 'package:flutter/material.dart';

class AppFunctionsProvider extends ChangeNotifier {
  bool _isHidden = true;

  bool get isHidden => _isHidden;

  void togglePasswordVisibility() {
    _isHidden = !_isHidden; // Toggle the private field
    print(_isHidden);
    notifyListeners(); // Notify listeners about the change
  }
}
