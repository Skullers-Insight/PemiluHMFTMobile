import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Axis {
  Axis({required this.x, required this.y});
  double x;
  double y;
}

class HomeViewModel extends BaseViewModel {
  String _title = 'Home View';
  String get title => _title;
  double _opacity = 0;
  double get opacity => _opacity;
  Axis _squareAxis = Axis(x: -100, y: 20);
  Axis get squareAxis => _squareAxis;
  Axis _circleAxis = Axis(x: -20, y: -20);
  Axis get circleAxis => _circleAxis;
  Axis _triangleAxis = Axis(x: -20, y: -20);
  Axis get triangleAxis => _triangleAxis;
  void revealHero() {
    _opacity = 1;
    _squareAxis = Axis(x: 10, y: 20);
    _circleAxis = Axis(x: 10, y: 20);
    _triangleAxis = Axis(x: 10, y: 20);
    notifyListeners();
  }
}
