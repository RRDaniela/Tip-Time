import 'package:flutter/material.dart';

class SelectedProvider extends ChangeNotifier {
  Map<String, int> get options => {'Amazing': 20, 'Good': 18, 'Okay': 15};

  int _selectedOption = 0;
  double _tipAmount = 0;
  bool _switchValue = false;
  int get selectedOption => _selectedOption;
  bool get switchValue => _switchValue;
  double get tipAmount => _tipAmount;

  set setswitchValue(bool val) {
    _switchValue = val;
    notifyListeners();
  }

  set setSelectedOption(int val) {
    _selectedOption = val;
    notifyListeners();
  }

  void tipAmountTotal(String tipInputField) {
    double returnValue = 0;
    double tipDouble = double.parse(tipInputField);
    tipDouble = (tipDouble * selectedOption / 100) + tipDouble;
    if (_switchValue) {
      returnValue = tipDouble.ceilToDouble(); //Rounding up
    } else {
      String rounding = tipDouble.toStringAsFixed(2);
      returnValue = double.parse(rounding);
    }
    _tipAmount = returnValue;
    notifyListeners();
  }
}
