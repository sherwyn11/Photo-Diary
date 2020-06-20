import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tape extends StatelessWidget {
  Tape({Key key, this.left, this.right, this.top, this.bottom})
      : super(key: key);

  final double left;
  final double right;
  final double top;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      bottom: bottom,
      top: top,
      child: Transform.rotate(
        angle: -pi / 4,
        child: Container(
          margin: const EdgeInsets.only(top: 0),
          height: 40,
          width: 200,
          color: Colors.grey[100].withOpacity(0.8),
        ),
      ),
    );
  }
}
