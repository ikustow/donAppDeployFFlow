import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  dynamic _tonConnector;
  dynamic get tonConnector => _tonConnector;
  set tonConnector(dynamic value) {
    _tonConnector = value;
  }

  String _tonLink = '';
  String get tonLink => _tonLink;
  set tonLink(String value) {
    _tonLink = value;
  }

  bool _tonConnected = false;
  bool get tonConnected => _tonConnected;
  set tonConnected(bool value) {
    _tonConnected = value;
  }

  int _startValue = 0;
  int get startValue => _startValue;
  set startValue(int value) {
    _startValue = value;
  }

  int _maxValue = 10000;
  int get maxValue => _maxValue;
  set maxValue(int value) {
    _maxValue = value;
  }

  bool _testMode = false;
  bool get testMode => _testMode;
  set testMode(bool value) {
    _testMode = value;
  }
}
