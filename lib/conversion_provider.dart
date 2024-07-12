import 'package:flutter/material.dart';

class ConversionProvider with ChangeNotifier {
  String _conversionType = 'F to C';
  double _inputValue = 0;
  String _result = '';
  List<String> _history = [];
  bool _isDarkMode = false;

  String get conversionType => _conversionType;
  String get result => _result;
  List<String> get history => _history;
  bool get isDarkMode => _isDarkMode;

  void updateConversionType(String type) {
    _conversionType = type;
    notifyListeners();
  }

  void updateInputValue(double value) {
    _inputValue = value;
  }

  void convert() {
    double convertedValue;
    if (_conversionType == 'F to C') {
      convertedValue = (_inputValue - 32) * 5 / 9;
      _result = '${_inputValue.toStringAsFixed(1)} F => ${convertedValue.toStringAsFixed(1)} C';
    } else {
      convertedValue = _inputValue * 9 / 5 + 32;
      _result = '${_inputValue.toStringAsFixed(1)} C => ${convertedValue.toStringAsFixed(1)} F';
    }
    _history.insert(0, _result);
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}
