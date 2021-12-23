import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => _title;
  String? _timeString;
  String? get timeString => _timeString;
  int _selectedIndex = 0; //New
  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
