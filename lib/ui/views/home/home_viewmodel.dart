import 'package:stacked/stacked.dart';

class Axis {
  Axis({required this.x, required this.y});
  double x;
  double y;
  void moveTo(double x, double y) {
    this.x = x;
    this.y = y;
  }
}

class HomeViewModel extends BaseViewModel {
  final String _title = 'Home View';
  String get title => _title;
  double _opacity = 0;
  double get opacity => _opacity;
  final Axis _squareAxis = Axis(x: -100, y: 100);
  Axis get squareAxis => _squareAxis;
  final Axis _circleAxis = Axis(x: 300, y: 20);
  Axis get circleAxis => _circleAxis;
  final Axis _triangleAxis = Axis(x: -20, y: -20);
  Axis get triangleAxis => _triangleAxis;
  void revealHero() {
    _opacity = 1;
    _squareAxis.moveTo(10, 0);
    _circleAxis.moveTo(200, 20);
    _triangleAxis.moveTo(10, 20);
    notifyListeners();
  }

  double _turns = 0;
  double get turns => _turns;
  void afterRevealAnimation() {
    _turns += 4.0;
  }
}
