import 'package:flutter/material.dart';

class BorderRadiusProvider with ChangeNotifier {
  double _topRight = 0;
  double _topLeft = 0;
  double _bottomRight = 0;
  double _bottomLeft = 0;

  double get topRight => _topRight;
  double get topLeft => _topLeft;
  double get bottomRight => _bottomRight;
  double get bottomLeft => _bottomLeft;

  void setTopRight(double value) {
    _topRight = value;
    notifyListeners();
  }

  void setTopLeft(double value) {
    _topLeft = value;
    notifyListeners();
  }

  void setBottomRight(double value) {
    _bottomRight = value;
    notifyListeners();
  }

  void setBottomLeft(double value) {
    _bottomLeft = value;
    notifyListeners();
  }
}
