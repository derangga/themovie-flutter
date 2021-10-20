import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void navigatePushNamed(String route, {Object arguments}) {
    Navigator.pushNamed(this, route, arguments: arguments);
  }
}
