import 'dart:ui';

import 'package:flutter_state/utils/output_state.dart';

class StateRed implements OutputState {
  @override
  Color getColor() {
    return const Color(0xFFC62828);
  }

  @override
  String getText() {
    return '赤色だよ';
  }
}