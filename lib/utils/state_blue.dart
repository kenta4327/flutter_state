import 'dart:ui';

import 'package:flutter_state/utils/output_state.dart';

class StateBlue implements OutputState {
  @override
  Color getColor() {
    return const Color(0xFF536DFE);
  }

  @override
  String getText() {
    return '青色だよ';
  }
}